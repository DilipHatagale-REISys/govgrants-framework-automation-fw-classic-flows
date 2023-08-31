package com.helperPackage.govgrants;

import com.helperPackage.handlers.govgrants;
import com.helperPackage.actionsfactory.api.ByUsing;
import com.helperPackage.objects.Elements;
import com.helperPackage.register.I;
import com.helperPackage.report.LogLevel;
import org.apache.commons.lang3.StringUtils;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.TimeoutException;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class Registration {

    public void beginRegistration(String officeType) {
        navigateToExternalPortal("SUBPORTAL");
        clickRegisterationLink("Register");
        if (!officeType.equalsIgnoreCase("Default")) {
            clickRegistrationType(officeType);
        }
        clickOfficeTypeButton(officeType, "Begin Registration");
    }

    public void navigateToExternalPortal(String portalName) {
        By pageConnectionReset = By.xpath("//*[text()='The connection was reset.' or text()='A network change was detected.'] | //div[@id='AppBodyHeader']");
        govgrants.perform().mainPage().navigateToPortal(portalName);
        for (int i = 0; i < 5 && I.amPerforming().checkToSee().IsElementPresentQuick(pageConnectionReset); i++) {
            govgrants.perform().mainPage().navigateToPortal(portalName);
        }
    }

    public void clickRegisterationLink(String linkText) {
        try {
            I.amPerforming().waitFor().ElementToBeClickable(getSignInLinkLocator(linkText));
            I.amPerforming().click().on(getSignInLinkLocator(linkText));
        } catch (TimeoutException e) {
            I.amPerforming().updatingOfReportWith().write(LogLevel.PROJECT_LAYER_ERROR,
                    String.format("Form Link '%s' was not able to be clicked.%n"
                            + "These are the form Links available to click: %s", linkText, getSignInLinkNames()));
            throw e;
        }
    }

    public By getSignInLinkLocator(String linkText) {
        return By.xpath("//form//a[" + I.amPerforming().sanityOfXpathTo().equals("text()", linkText) + "]"
                + " | "
                + "//form//input[@type='submit' and " + I.amPerforming().sanityOfXpathTo().equals("@value", linkText) + "]");
    }

    public List<String> getSignInLinkNames() {
        try {
            I.amPerforming().waitFor().ElementToBePresent(getSignInLinksLocator(), 2);
        } catch (Exception e) {
            /* Ignore Exception */
        }
        return I.amPerforming().getElementReference().forListOfElements().of(getSignInLinksLocator(), false).stream()
                .map(el -> el.getAttributes("value") == null ? el.getText().trim() : el.getAttributes("value").trim())
                .collect(Collectors.toList());
    }

    public By getSignInLinksLocator() {
        return By.xpath("//form//a[text()]"
                + " | "
                + "//form//input[@type='submit' and @value]");
    }

    /**
     * To click on office type button on the Registration page
     *
     * @param officeType
     * @author monu.kumar
     * @modifier ashwini.mahore
     */
    public void clickOfficeTypeButton(String officeType, String buttonName) {
        try {
            I.amPerforming().checkToSee().IsElementPresentQuick(getOfficeTypeButtonLocator(officeType, buttonName));
            I.amPerforming().click().on(getOfficeTypeButtonLocator(officeType, buttonName));
        } catch (TimeoutException e) {
            I.amPerforming().updatingOfReportWith().write(LogLevel.PROJECT_LAYER_ERROR,
                    String.format("Registration page button '%s' for office type '%s' was not able to be clicked.%n"
                                    + "These are the office types available:     %s%n"
                                    + "These are the buttons available for '%s': %s",
                            buttonName, officeType, officeType, getOfficeTypeButtonNames(officeType)));
            throw e;
        }
    }

    public By getOfficeTypeButtonLocator(String officeType, String buttonName) {
        return By.xpath("//div[contains(@class, 'panel-default')]"
                + "//a[contains(@class, 'customBtn')][" + I.amPerforming().sanityOfXpathTo().equals("text()", buttonName) + "] | //div[contains(@class, 'panel-default') and .//text()[" + I.amPerforming().sanityOfXpathTo().equals(".", officeType) + "]]//a[contains(@class, 'customBtn')][" + I.amPerforming().sanityOfXpathTo().equals("text()", buttonName) + "] | //a[contains(@class, 'customBtn')][" + I.amPerforming().sanityOfXpathTo().equals("text()", buttonName) + "]");
    }

    public List<String> getOfficeTypeButtonNames(String officeType) {
        try {
            I.amPerforming().waitFor().ElementToBePresent(getOfficeTypeButtonsLocator(officeType), 2);
        } catch (Exception e) {
            /* Ignore Exception */
        }
        return I.amPerforming().getElementReference().forListOfElements().of(getOfficeTypeButtonsLocator(officeType), false)
                .stream().map(el -> StringUtils.normalizeSpace(el.getText())).collect(Collectors.toList());
    }

    public By getOfficeTypeButtonsLocator(String officeType) {
        return By.xpath("//div[contains(@class, 'panel-default') and .//text()[" + I.amPerforming().sanityOfXpathTo().equals(".", officeType) + "]]//a[contains(@class, 'customBtn')]");
    }

    /**
     * To click on header button on the Registration page
     *
     * @param tabName
     * @author meenakshi.jha
     */
    public void clickOnTabName(String tabName) {
        I.amPerforming().click().on(ByUsing.xpath("//a[contains(text(),'" + tabName + "')]"));
    }

    /**
     * Handles to perform validation on the Registration page
     *
     * @param usage
     * @param texts
     * @author meenakshi.jha
     * @modifier saranjit.modak added xpath 06.08.2021
     * @modifier: saranjit.modak - Added new xpath - 19/07/2022
     */
    public void assertTheInstructionTextInThePage(String usage, List<String> texts) {
        if (usage.equalsIgnoreCase("see")) {
            Assert.assertTrue(isInstructionTextDisplayedInThePage(texts));
        } else if (usage.equalsIgnoreCase("softly see")) {
            I.amPerforming().assertionsTo().assertThat(isInstructionTextDisplayedInThePage(texts)).isTrue();
        } else if (usage.equalsIgnoreCase("do not see")) {
            Assert.assertFalse(isInstructionTextDisplayedInThePage(texts));
        } else if (usage.equalsIgnoreCase("softly do not see")) {
            I.amPerforming().assertionsTo().assertThat(isInstructionTextDisplayedInThePage(texts)).isFalse();
        }

    }

    private Boolean isInstructionTextDisplayedInThePage(List<String> texts) {
        boolean flag = false;
        try {
            List<Elements> elements = I.amPerforming().getElementReference().forListOfElements().of(ByUsing.xpath("//div[@class='col-xs-12 col-md-12 col-lg-12']//li | //div[@class='col-xs-12 col-md-12 col-lg-12']//ol | //div[contains(@class,'col-xs-12 col-md-12 col-lg-12')]/span | //div[@class='col-md-12 col-sm-12 col-xs-12']/span"));
            List<String> qlist = new ArrayList<String>();
            for (int i = 0; i < elements.size(); i++) {
                qlist.add(StringUtils.normalizeSpace(elements.get(i).getText().trim()));
            }
            if (qlist.containsAll(texts)) {
                flag = true;
            }
        } catch (Exception e) {
            //unhandled exception
        }
        return flag;
    }

    /**
     * To create users
     * Note:You need to create an excel file with two sheets "url" and "userList" as the name createuser.xlsx
     * TODO: need to work on create external user
     * Created By :- Aashish P.
     */
    public void createUsers() {
        String[][] urldata = I.amPerforming().fileHandling().forExcelAnd().readExcelFile("createuser.xlsx", "url");
        String[] ucolumn = urldata[0];
        I.amPerforming().browserOperationsTo().navigateToUrl(ucolumn[0]);

        By userOption = By.xpath("//div[@id='Users_child']//a[text()='Users']");
        By selectUserType = By.xpath("//select[@id='fcf']");
        By newUserButton = By.xpath("//input[@value='New User']");
        By userLic = By.xpath("//select[@id='user_license_id']");
        By role = By.xpath("//select[@id='role']");
        By profile = By.xpath("//select[@id='Profile']");
        By firstName = By.xpath("//input[@id='name_firstName']");
        By lastName = By.xpath("//input[@id='name_lastName']");
        By email = By.xpath("//input[@id='Email']");
        By nickname = By.xpath("//input[@id='CommunityNickname']");
        By saveButton = By.xpath("//input[@title='Save']");

        String[][] data = I.amPerforming().fileHandling().forExcelAnd().readExcelFile("createuser.xlsx", "userlist");
        int rows = data.length;
        for (int i = 0; i < rows; i++) {
            String[] column = data[i];

            //click on user option from right table
            I.amPerforming().click().on(userOption);

            //select the user type from dropdown
            if (column[0].equalsIgnoreCase("internal")) {
                I.amPerforming().dropDownSelection().from(selectUserType).selectByVisibleText("Active Internal Users");
            } else if (column[0].equalsIgnoreCase("external")) {
                I.amPerforming().dropDownSelection().from(selectUserType).selectByVisibleText("Active Partner Users");
            }

            //click on new user button
            I.amPerforming().click().on(newUserButton);

            //To enter global data
            I.amPerforming().dropDownSelection().from(userLic).selectByVisibleText("Salesforce Platform");
            I.amPerforming().dropDownSelection().from(role).selectByVisibleText("Legal Services Corporation");

            //To enter data from excel file
            if (column[0].equalsIgnoreCase("internal")) {
                I.amPerforming().dropDownSelection().from(profile).selectByVisibleText(column[1]);
                I.amPerforming().textInput().in(firstName, column[2]);
                I.amPerforming().textInput().in(lastName, column[3]);
                I.amPerforming().textInput().in(email, column[4]);
                I.amPerforming().textInput().toClear(nickname);
                I.amPerforming().textInput().in(nickname, column[5]);
                I.amPerforming().click().on(saveButton);
                I.amPerforming().waitFor().makeThreadSleep(10000);
            } else if (column[0].equalsIgnoreCase("external")) {
                //future scope
            }
        }
        for (int j = 0; j < rows; j++) {
            String[] column = data[j];
            //Method to read email and redirect to create password page
            readEmail(column[4]);
            //Method to create new password for new user
            resetPassword(column[6]);
        }
    }

    public void readEmail(String email) {
        String[] emailId = email.split("@");
        I.amPerforming().browserOperationsTo().navigateToUrl("http://www.yopmail.com/");
        I.amPerforming().textInput().toClear(By.xpath("//input[@id='login' and @type='text']"));
        I.amPerforming().textInput().in(By.xpath("//input[@id='login' and @type='text']"), emailId[0]);
        I.amPerforming().click().on(By.xpath("//input[@value='Check Inbox' and @type='submit']"));
        //code to check mail subject and click on mail
        try {
            String mailSubject = "";
            for (int i = 0; i < 60; i++) {
                I.amPerforming().click().on(By.xpath("//div[@id='m1']//a[@class='lm']"));
                mailSubject = I.amPerforming().getElementReference().of(By.xpath("//div[@class='f16']")).getText();
                if (mailSubject.equalsIgnoreCase("Sandbox: Welcome to Salesforce: Verify your account")) {
                    I.amPerforming().click().on(By.xpath("//div[@id='mailmillieu']//a[text()='Verify Account']"));
                    break;
                }
                I.amPerforming().waitFor().makeThreadSleep(1000);
                I.amPerforming().click().on(By.xpath("//span[@class='slientext']"));
            }
        } catch (Exception e) {
            //unhandled exception
        }
    }

    public void resetPassword(String password) {
        I.amPerforming().textInput().in(By.xpath("//input[@id='newpassword']"), password);
        I.amPerforming().textInput().in(By.xpath("//input[@id='confirmpassword']"), password);
        I.amPerforming().textInput().in(By.xpath("//input[@name='answer']"), "California");
        I.amPerforming().click().on(By.xpath("//button[@id='password-button']"));
    }

    public void clickCenterButton(String buttonName) {
        I.amPerforming().click().on(ByUsing.xpath("//a[contains(@class, 'customBtn')][" + I.amPerforming().sanityOfXpathTo().equals("text()", buttonName) + "]"));
    }

    public void performOperationsOnYopmailWithMail(String portal, String emailId, String subject, String expectedLink) {
        if (portal.equals("yopmail")) {
            I.amPerforming().browserOperationsTo().navigateToUrl("http://www.yopmail.com/");
            I.amPerforming().textInput().toClear(By.xpath("//input[@id='login' and @type='text']"));
            I.amPerforming().textInput().in(By.xpath("//input[@id='login' and @type='text']"), emailId);
            I.amPerforming().click().on(By.xpath("//input[@value='Check Inbox' and @type='submit'] | //button[@title='Check Inbox @yopmail.com']/i"));
            //code to click mail
            try {
                String mailSubject = "";
                for (int i = 0; i < 60; i++) {
                    List<Elements> list1 = I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@id='m1']//a[@class='lm'] | //div[@class='mctn']//div[@class='m']"));
                    if (list1.size() != 0) {
                        I.amPerforming().click().on(By.xpath("//div[@id='m1']//a[@class='lm'] | //div[@class='mctn']//div[@class='m']"));
                    } else {
                        I.amPerforming().waitFor().makeThreadSleep(4000);
                        I.amPerforming().click().on(By.xpath("//span[@class='slientext'] | //button[@id='refresh']"));
                        continue;
                    }
                    mailSubject = I.amPerforming().getElementReference().of(By.xpath("//div[@class='f16'] | //div[@id='wmmailmain']")).getText();
                    if (mailSubject.equalsIgnoreCase(subject)) {
                        I.amPerforming().click().on(By.xpath("//div[@id='mailmillieu']//a[contains(@href,'login') //div[@id='mailmillieu'] | //a[contains(@href,'recipientportal') | //div[@id='mailmillieu']//a[contains(@href,'Comment')] | //div[@id='mail']//a[contains(text(),'here')]"));
                        break;
                    }
                    I.amPerforming().waitFor().makeThreadSleep(4000);
                    I.amPerforming().click().on(By.xpath("//span[@class='slientext'] | //button[@id='refresh']"));
                }
            } catch (Exception e) {
                //unhandled exception
            }
        } else if (portal.equals("mailDropCC")) {
            String[] mailArray = emailId.split("@", 2);
            emailId = mailArray[0];
            I.amPerforming().browserOperationsTo().navigateToUrl("http://www.maildrop.cc/");
            I.amPerforming().textInput().toClear(By.xpath("//div[contains(@class,'logotype')]/ancestor::div/following-sibling::div//input[@placeholder='view-this-inbox']"));
            I.amPerforming().textInput().in(By.xpath("//div[contains(@class,'logotype')]/ancestor::div/following-sibling::div//input[@placeholder='view-this-inbox']"), emailId);
            I.amPerforming().click().on(By.xpath("//div[contains(@class,'logotype')]/ancestor::div/following-sibling::div//button/span[text()='View Inbox']"));
            By actualmMailSubjectLine = By.xpath("//div[@class='messagelist-container']/div[1]/a");
            try {
                for (int i = 0; i < 60; i++) {
                    I.amPerforming().click().on(By.xpath("//button/span[text()='Reload']"));
                    if (I.amPerforming().checkToSee().IsElementPresentQuick(actualmMailSubjectLine)) {
                        I.amPerforming().browserOperationsTo().refreshPage();
                        I.amPerforming().waitFor().makeThreadSleep(9000);
                        I.amPerforming().click().on(actualmMailSubjectLine);
                        I.amPerforming().waitFor().makeThreadSleep(9000);
                        I.amPerforming().switchTo().frame(ByUsing.xpath("//iframe[@class='messagedata-iframe']"));
                        List<Elements> list = I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//a[contains(text(),'here')]"));
                        for (int j = 0; j < list.size(); j++) {
                            System.out.println(list.get(j).getAttributes("href"));
                        }
                        String link = I.amPerforming().actionToGet().attribute(By.xpath("//a[contains(@href,'" + expectedLink + "')]"), "href");
                        System.out.println("This is the link: " + link);
                        I.amPerforming().browserOperationsTo().navigateToUrl(link);
                        I.amPerforming().waitFor().makeThreadSleep(4000);
                        break;
                    }
                    I.amPerforming().waitFor().makeThreadSleep(4000);
                    I.amPerforming().click().on(By.xpath("//button/span[text()='Reload']"));
                }
            } catch (Exception e) {
                //unhandled exception
            }
        }
    }

    public void clickRegistrationType(String registrationType) {
        I.amPerforming().waitFor().ElementToBeClickable(ByUsing.xpath("//a[contains(text(),'" + registrationType + "')]"));
        I.amPerforming().click().on(ByUsing.xpath("//a[contains(text(),'" + registrationType + "')]"));
    }
}
