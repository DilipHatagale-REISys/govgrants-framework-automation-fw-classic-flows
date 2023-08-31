package com.helperPackage.govgrants;


import com.helperPackage.handlers.govgrants;
import com.helperPackage.actionsfactory.api.ByUsing;
import com.helperPackage.controller.TestSetupController;
import com.helperPackage.register.EnvironmentFactory;
import com.helperPackage.register.I;
import com.helperPackage.report.LogLevel;
import org.apache.commons.io.FilenameUtils;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.WebDriverException;
import org.openqa.selenium.WebElement;

import java.awt.*;
import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;
import java.util.Objects;

import static com.helperPackage.misclib.ConsoleFormatter.COLOR.GREEN;
import static com.helperPackage.misclib.ConsoleFormatter.ICON.TICK;

public final class MainPage {
    public static By navLogo = By.xpath(""
            + "//div[@id='holdon-overlay']" // https://bit.ly/2WgAkE1
            + " | "
            + "//div[@class='rowLevelOverlay'] | //div[@class='modalLoadIcon' and @style='display: block;']");
    private final By
            loginDropDown = By.xpath("//div[contains(@class,'navTopHeader')]//li[@class='dropdown userDropdown']//a[@class='dropdown-toggle']"),
            egmsHeader = By.xpath("//span[contains(@class, 'navbarBrandText')]"),
            topRightDropDown = By.cssSelector("div>ul>li.dropdown.appDropdown>a"),
            navProfile_CurrentApp = By.cssSelector("div#myNavbarProfile>ul>li>a>span"),
            loginButton = By.xpath("//*[@type='submit' and not(contains(@value, 'Register')) and not(contains(@value, 'Cancel'))] | //div[@class='loginBtnWrap']//button"),
            userName = By.xpath("//input[@name='username' or @id='username' or @name='userName' or @type='email' or @placeholder='Username' or contains(@name,'username')]"),
            password = By.xpath("//input[@type='password' or @placeholder='Password']"),
            acceptTerms = By.xpath("//input[contains(@id,'accept') or contains(@id,'Accept')]"),
            loginResult = By.xpath("//span[contains(@class, 'navbarBrandText')]" +
                    " | //li[contains(@class, 'main-title')]" +
                    " | //*[text()='GovGrants Launcher']" +
                    " | //a[text()=\"I Don't Want to Register My Phone\"]"),
            govGrantsLauncherButton = By.xpath("//ul/li/a[@title='GovGrants Launcher Tab']"),
            declinePhoneRegistrationButton = By.xpath("//a[text()=\"I Don't Want to Register My Phone\"]"),
            lightningDialogBox = By.xpath("//div[@class='overlayDialog tryLightning']");

    /******* "Key Methods with complete functionality - Public" *****************/

    /**
     * navigate to a url
     *
     * @param url
     * @throws IOException
     */
    public void navigateToURL(String url) {
        I.amPerforming().browserOperationsTo().navigateToUrl(url);

    }

    /**
     * navigate to a specific named url.
     *
     * @param portalType the given name of the url (e.g. "External"). The meaning of
     *                   the name is set at hte project level in the UsersAndURL
     *                   class.
     * @throws IOException
     * @author john.phillips
     */
    public void navigateToPortal(String portalType) {
        I.amPerforming().cookiesOperationsTo().deleteAllCookies();
        I.amPerforming().browserOperationsTo().navigateToUrl(TestSetupController.usersController.getPortalUrl(portalType));
    }

    /**
     * takes user type like Exe. connects with UsersAndURL class of local project to
     * fetch the user id and password
     *
     * @param userType
     */
    public void loginWithUserType(String userType) {
        login(TestSetupController.usersController.getUserName(userType),
                TestSetupController.usersController.getPassword(userType));
    }

    /**
     * login with userName and password
     *
     * @param userNameText
     * @param passwordText
     * @modified komal.mukhekar/vaibhav.chandratre - Handled WebDriverExceptionwhen there is a driver and browser version incompatibility issue
     */
    public void login(String userNameText, String passwordText) {
        //Ensures if the Logging out blank screen if faded away
        if (I.amPerforming().checkToSee().IsElementPresentQuick(By.xpath("//iframe[@src='/secur/logout.jsp']"))) {
            I.amPerforming().waitFor().ElementToDisappear(By.xpath("//iframe[@src='/secur/logout.jsp']"));
        }
        //Enters user name and password
        I.amPerforming().textInput().in(userName, userNameText);
        I.amPerforming().textInput().in(By.xpath("//input[@type='password']"), passwordText);
        if (I.amPerforming().checkToSee().IsElementPresentQuick(acceptTerms)) {
            I.amPerforming().click().on(acceptTerms);
        }
        try {
            I.amPerforming().click().on(loginButton);
        } catch (WebDriverException e) {
            I.amPerforming().getElementReference().of(By.xpath("//a[@title='Home Tab'] | //a[@title='Home Tab - Selected'] | //a[@title='Home']"));
        }

        if (I.amPerforming().checkToSee().IsElementPresentQuick(declinePhoneRegistrationButton)) {
            try {
                I.amPerforming().click().on(declinePhoneRegistrationButton);
                I.amPerforming().waitFor().ElementToBePresent(loginResult);
            } catch (Exception e) {
                /* Ignore Exception */
            }
        }

        if (EnvironmentFactory.getProjectName().contains("GovGrants Framework"))
            try {
                clickAdminNavBar("GovGrants Launcher Tab");
            } catch (Exception e) {
                // to handle any other URL where there is not Govgrants launcher
            }
    }

    /**
     * Performs login and toggles app. connects with UsersAndURL class of local
     * project to fetch the user id and password
     *
     * @param appName
     * @param userType
     */
    public void loginToggleToApp(String appName, String userType) {
        login(TestSetupController.usersController.getUserName(userType),
                TestSetupController.usersController.getPassword(userType));
        setUpCustomAppDropDown(appName);
    }

    /**
     * Handles re-logging as a different user type and toggling to the app
     * specified.connects with UsersAndURL class of local project to fetch the user
     * id and password
     *
     * @param appName
     * @param userType
     * @throws IOException
     */
    public void reloginToggleToApp(String appName, String userType) {
        reloginAsDifferentUser(userType);
        setUpCustomAppDropDown(appName);
    }

    /**
     * Handles re-logging as a different user type specified.connects with
     * UsersAndURL class of local project to fetch the user id and password
     *
     * @param userType
     * @throws IOException
     */
    public void reloginAsDifferentUser(String userType) {
        I.amPerforming().waitFor().makeThreadSleep(700);
        clickLoginDropDown();
        clickLoginDropDownItems("Logout");
        I.amPerforming().cookiesOperationsTo().deleteAllCookies();
        I.amPerforming().waitFor().makeThreadSleep(200);
        I.amPerforming().browserOperationsTo().navigateToUrl(EnvironmentFactory.getEnvironmentUrl());
        login(TestSetupController.usersController.getUserName(userType),
                TestSetupController.usersController.getPassword(userType));
        waitForEgmsHeader();
    }

    /**
     * Handles re-logging as a different user and toggling to the app specified in
     * the new given portal
     *
     * @param appName
     * @param userType
     * @param portalType
     * @throws IOException
     * @author hema.ananthan
     */
    public void reloginToggleToAppInNewPortal(String appName, String userType, String portalType) {
        I.amPerforming().waitFor().makeThreadSleep(1000);
        clickLoginDropDown();
        clickLoginDropDownItems("Logout");
        I.amPerforming().cookiesOperationsTo().deleteAllCookies();
        I.amPerforming().waitFor().makeThreadSleep(200);
        I.amPerforming().browserOperationsTo().navigateToUrl(TestSetupController.usersController.getPortalUrl(portalType));
        login(TestSetupController.usersController.getUserName(userType),
                TestSetupController.usersController.getPassword(userType));
        waitForEgmsHeader();
        setUpCustomAppDropDown(appName);
    }

    /**
     * Asserts that the header bar is present.
     *
     * @author john.phillips
     */
    public void assertLoggedIn() {
        try {
            I.amPerforming().waitFor().ElementToBePresent(egmsHeader);
        } catch (TimeoutException e) {
            Assert.fail("Login Failed");
        }
    }

    /**
     * wait for the EGMS header in Gov Grants
     */
    public void waitForEgmsHeader() {
        try {
            I.amPerforming().waitFor().ElementToBePresent(egmsHeader);
        } catch (TimeoutException e) {
            /* Ignore Exception */
        }
    }

    /**
     * waits for navigation logo to get disappeared
     */
    public void waitForNavigationLogoToDisappear() {
        try {
            if (I.amPerforming().checkToSee().isDisplayed(navLogo, false)) {
                I.amPerforming().updatingOfReportWith().write(LogLevel.TEST_BLAZE_INFO, GREEN, TICK, "Processing the Navigation Logo");
                I.amPerforming().waitFor().ElementToDisappear(navLogo, 120);
            }
        } catch (Exception e) {
        }
    }

    /**
     * click on top right drop down. As a grantee etc.
     */
    public void clickOnAppDropDown() {
        I.amPerforming().click().on(topRightDropDown);
    }

    /**
     * click on logout menu.
     */
    public void clickLoginDropDown() {
        I.amPerforming().click().on(loginDropDown);
    }

    /**
     * get the top right drop down items. grntee etc
     *
     * @param dropDownItem
     * @return
     */
    public WebElement getAppDropDownItem(String dropDownItem) {
        By appDropDown = By
                .xpath("//div/ul/li[contains(@class,'dropdown appDropdown')]/ul/li/a[@title='" + dropDownItem + "']");

        return I.amPerforming().getElementReference().of(appDropDown);
    }

    /**
     * access items in logout menu items
     *
     * @param loginMenuItem
     * @return
     */
    public void clickLoginDropDownItems(String loginMenuItem) {
        I.amPerforming().click().on(getLoginDropDownItems(loginMenuItem));
    }

    /**
     * click on navigation bar item inside app. e.g; planning,announcements etc
     *
     * @param tabName
     */
    public void clickMainMenuBar(String tabName) {
        By mainMenuButton = By.xpath("//div/ul[@class='nav navbar-nav' or @class='nav nav-tabs']/li/a[@title='" + tabName
                + "' or @name='" + tabName + "'] | //nav/ul/li/a[@title='" + tabName + "' or @name='" + tabName + "']");
        if (EnvironmentFactory.getDevice().equalsIgnoreCase("firefox")) {
            I.amPerforming().waitFor().makeThreadSleep(3000);
        }
        I.amPerforming().click().on(mainMenuButton);
    }

    /**
     * click on navigation bar item on main admin homepage.
     *
     * @param tabName
     */
    public void clickAdminNavBar(String tabName) {
        By adminMenuButton = By.xpath("//ul/li/a[@title='" + tabName + "']");
        I.amPerforming().click().withJavaScript(adminMenuButton);
    }

    /**
     * click on my workspace items at grantor Home main page
     *
     * @param myWorkspaceItem
     * @modifier ashwini.mahore
     */
    public void clickOnMyWorkSpaceSpecificItem(String myWorkspaceItem) {
        I.amPerforming().click().on(getMyWorkSpaceSpecificItem(myWorkspaceItem));
    }

    /**
     * handles custom app. selects if current app on page is not desired one
     *
     * @param appName
     * @modifier ashwini.mahore
     */
    public void setUpCustomAppDropDown(String appName) {
        I.amPerforming().waitFor().makeThreadSleep(200);
        if (!isAppDisplayed(appName)) {
            I.amPerforming().waitFor().makeThreadSleep(200);
            clickOnAppDropDown();
            I.amPerforming().waitFor().makeThreadSleep(500);
            I.amPerforming().click().on(getAppDropDownItem(appName));
        }
    }

    /**
     * click on options like (plus icon, list icon, large active icon) inside Notes of my workspace at Grantor Home main page
     * It will accept only (plus, list, box) names from feature file, if we want click on any of the options.
     *
     * @param iconName
     * @author Monu Kumar
     */
    public void clickOnUserNotesItemInsideMyWorkSpaceNotes(String iconName) {
        String type = "";
        if (iconName.equalsIgnoreCase("plus")) {
            type = "fa fa-plus";
        } else if (iconName.equalsIgnoreCase("list")) {
            type = "fa fa-list-ul";
        } else if (iconName.equalsIgnoreCase("box")) {
            type = "fa fa-th-large active";
        }
        By notesSubTabIcon = By.xpath("//div//span//button/i[contains(@class,'" + type + "')]/parent::button");
        I.amPerforming().click().on(notesSubTabIcon);
    }

    /**
     * click on x icon on stickey note inside notes of HOME Phase
     */
    public void deleteAddedStickeyNotes(String icon) {
        By iconToClose = By.xpath("//span[contains(@id,'close') or text='" + icon + "']");
        I.amPerforming().click().on(iconToClose);
    }

    /**
     * click on x icon on stickey note inside notes of HOME Phase
     */
    public void deleteAddedStickeyNotesWithTitle(String stickyTitle, String icon) {
        By iconToCloseWithTitle = By.xpath("//a[contains(@aria-label,'" + stickyTitle + "')]/preceding-sibling::span[contains(@id,'close') or text='" + icon + "']");
        I.amPerforming().click().on(iconToCloseWithTitle);
    }

    /******* "Local Methods with Limited functionality - Private" **********/

    private boolean isAppDisplayed(String appName) {
        boolean isAppPresent;
        try {
            isAppPresent = I.amPerforming().actionToGet().text(navProfile_CurrentApp).equalsIgnoreCase(appName);
        } catch (Exception e) {
            I.amPerforming().browserOperationsTo().refreshPage();
            isAppPresent = I.amPerforming().actionToGet().text(navProfile_CurrentApp).equalsIgnoreCase(appName);
        }
        return isAppPresent;
    }

    /**
     * @param phaseName
     * @return phase from home page task summary
     */
    public By getSpecificPhaseInTaskSummaryByPhase(String phaseName) {
        return By.xpath("//div[@id='taskSummaryDiv']//*[text()='Task Summary By Phase']/../..//span[text()='"
                + phaseName + "']");
    }

    private WebElement convertToWebElement(By locator) {
        return I.amPerforming().getElementReference().of(locator);
    }

    /**
     * save PDF file using robot class
     *
     * @throws AWTException
     */
    public void saveFile() throws AWTException {
        I.amPerforming().waitFor().makeThreadSleep(15000);
        I.amPerforming().robotActionsTo().ctrl_Save();
        I.amPerforming().waitFor().makeThreadSleep(15000);
        I.amPerforming().robotActionsTo().enter();
        I.amPerforming().waitFor().makeThreadSleep(15000);
        I.amPerforming().robotActionsTo().escape();
        String downloadedfileName = Objects.requireNonNull(getFileFromDownloadsFolder()).getName();
        if (FilenameUtils.getExtension(downloadedfileName).contains("pdf"))
            getFileFromDownloadsFolder().renameTo(new File(System.getProperty("user.dir") + "/target/" + "govgrants" + "." + FilenameUtils.getExtension(downloadedfileName)));
    }

    public File getFileFromDownloadsFolder() {
        String downloadLocation = System.getProperty("user.home");
        File dir = new File(downloadLocation + "/Downloads/");
        File[] files = dir.listFiles();
        if (files == null || files.length == 0) {
            return null;
        }
        File lastModifiedFile = files[0];
        for (int i = 1; i < files.length; i++) {
            if (lastModifiedFile.lastModified() < files[i].lastModified()) {
                lastModifiedFile = files[i];
            }
        }
        return lastModifiedFile;
    }

    /**
     * Assert text inside downloaded PDF file
     *
     * @param text
     * @param pageNumber
     * @param fileName
     */
    public boolean assertTextInPDF(String text, int pageNumber, String fileName) {
        boolean flag = false;
        if (readAndRenamePDFFile(pageNumber, fileName).contains(text)) {
            flag = true;
        }
        return flag;
    }

    public String readAndRenamePDFFile(int pageNumber, String fileName) {
        File file = new File(System.getProperty("user.dir") + File.separatorChar + "target");
        I.amPerforming().waitFor().makeThreadSleep(5000);
        I.amPerforming().fileHandling().toRenameFileWithSpecificExtension(file, fileName, "pdf", "pdf");
        return I.amPerforming().fileHandling().forAdobeReaderAnd().readFromAdobeFileOnLocalAtUserDirectory(
                file.getAbsolutePath() + "/" + fileName + ".pdf", pageNumber);
    }

    /**
     * return true if expected text is not displayed inside downloaded xls file
     *
     * @param text
     * @param fileName
     * @return
     * @author Monu.Kumar
     * @modifier ashwini.mahore - removed step to switch to window handler
     * @modifier ashwini.mahore - added step to switch to window
     */
    public boolean assertTextInsideXLSAndCSVFile(String text, String fileName) {
        boolean flag = false;
        govgrants.perform().modal().acceptPopUp();
        I.amPerforming().switchTo().windowHandler(0);
        List<String> strContents = readXLSAndCSVFile(fileName);
        if (strContents.toString().contains(text)) {
            flag = true;
        }
        return flag;
    }

    /**
     * Rename the file and change it from .xls to .html Read from html file
     *
     * @param fileName
     * @return
     * @author Monu.Kumar
     */
    public List<String> readXLSAndCSVFile(String fileName) {
        String extensionType = "";
        I.amPerforming().waitFor().makeThreadSleep(5000);
        File file = new File(System.getProperty("user.dir") + File.separator + "target");
        File[] directory = I.amPerforming().fileHandling().toGetCompleteFilesListOnLocalDirectory(file.getAbsolutePath());
        for (File files : directory) {
            if (files.getName().endsWith(".xls")) {
                new File(files.getAbsolutePath())
                        .renameTo(new File(file.getAbsolutePath() + File.separator  + fileName + ".xls"));
                extensionType = ".xls";
                break;
            } else if (files.getName().endsWith(".csv")) {
                new File(files.getAbsolutePath())
                        .renameTo(new File(file.getAbsolutePath() + File.separator + fileName + ".csv"));
                extensionType = ".csv";
                break;
            } else if (files.getName().endsWith(".xlsx")) {
                try {
                    Files.lines(Path.of(file.getAbsolutePath() + File.separator + fileName + ".xlsx"), Charset.forName("UTF8"));
                } catch (IOException e) {
                    e.printStackTrace();
                }
                new File(files.getAbsolutePath())
                        .renameTo(new File(file.getAbsolutePath() + File.separator + fileName + ".xlsx"));
                extensionType = ".xlsx";
                break;
            }
        }

        return I.amPerforming().fileHandling().toReadAnyFile(file.getAbsolutePath() + File.separator + fileName + extensionType);

    }

    public By getLoginDropDownItems(String loginMenuItem) {
        return By
                .xpath("//div/ul/li[contains(@class,'dropdown userDropdown')]/ul/li/a[@title='" + loginMenuItem + "']");
    }

    /**
     * to get the workspace items/tab from home phase
     *
     * @param myWorkspaceItem
     * @author ashwini.mahore
     * @modifier meenakshi.jha added xpath
     * @modifier richa.sharma added xpath
     */
    public By getMyWorkSpaceSpecificItem(String myWorkspaceItem) {
        return ByUsing.xpath("//div//span//button[@id='" + myWorkspaceItem + "'] | //div//span[@id='" + myWorkspaceItem + "'] | //div//span//a[@id='" + myWorkspaceItem + "']");
    }
}