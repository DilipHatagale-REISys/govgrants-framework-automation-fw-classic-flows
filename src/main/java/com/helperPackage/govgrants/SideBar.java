package com.helperPackage.govgrants;


import com.helperPackage.actionsfactory.api.ByUsing;
import com.helperPackage.objects.Elements;
import com.helperPackage.register.I;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.util.List;

public final class SideBar {
    private final By sideBarHeadersList = By.xpath(
            "//div[@id='sidebar-wrapper']//div[contains(@class,'customSidebar ')]//a/span/following-sibling::span");

    /******* "Key Methods with complete functionality - Public" *****************/

    /**
     * click on main Accordian header
     *
     * @param headerName
     * @author nauman.shahid
     */
    public void clickMainSideBarHeader(String headerName) {
        I.amPerforming().click().on(getSideBarHeaderLocator(headerName));

    }

    /**
     * click on sub accordian header
     *
     * @param mainHeader
     * @param subHeaderName
     * @author nauman.shahid
     */
    public void clickSideBarSubHeader(String mainHeader, String subHeaderName) {
        handleSideBarContentExpanded(subHeaderName);
        I.amPerforming().click().on(getSideBarSubHeaderLocator(mainHeader, subHeaderName));

    }

    /**
     * Handle click on side bar content
     *
     * @param subHeaderName
     * @param contentName
     * @author nauman.shahid
     */
    public void clickSideBarContent(String subHeaderName, String contentName) {
        handleSideBarContentExpanded(subHeaderName);
        I.amPerforming().click().on(getSideBarContentLocator(subHeaderName, contentName));

    }

    /**
     * click on side bar content with mainHeader
     * NOTA BENE: Does not handle collapsed side bar
     *
     * @param mainHeader
     * @param subHeaderContentName
     * @author nauman.shahid
     */
    public void clickSideBarsubHeaderContent(String mainHeader, String subHeaderContentName) {
        By sideBarContent = By.xpath("//div[@id='sidebar-wrapper']//*[contains(text(),'"
                + mainHeader + "')]/../../../../../../..//*["
                + I.amPerforming().sanityOfXpathTo().equals("text()", subHeaderContentName)
                + "]/ancestor::li[1]//a | " + "//div[@id='sidebar-wrapper']//*["
                + I.amPerforming().sanityOfXpathTo().contains("text()", mainHeader)
                + "]/../..//*["
                + I.amPerforming().sanityOfXpathTo().equals("text()", subHeaderContentName)
                + "]/ancestor::li[1]//a");
        I.amPerforming().click().on(sideBarContent);

    }

    /**
     * @return: List of all side bar headers.The first main header.
     * @author nauman.shahid
     */
    public List<Elements> getSideBarMainHeader() {
        return I.amPerforming().getElementReference().forListOfElements().of(sideBarHeadersList);
    }

    /**
     * @param mainHeaderName
     * @return: List of all sub headers. Second one in the sidebar
     */
    public List<Elements> getSideBarSubHeaders(String mainHeaderName) {
        return I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@id='sidebar-wrapper']//div/ul/li" + "//*["
                + I.amPerforming().sanityOfXpathTo().equals("text()", mainHeaderName) + "]/../../ul/li/a/span"));
    }

    /**
     * @param mainHeaderName
     * @return: List of all contents under sub headers of side bar
     * @author nauman.shahid
     */
    public List<Elements> getSideBarContents(String mainHeaderName) {
        return I.amPerforming().getElementReference().forListOfElements().of(By.xpath("//div[@id='sidebar-wrapper']//div/ul/li" + "//*["
                + I.amPerforming().sanityOfXpathTo().equals("text()", mainHeaderName) + "]/../../ul/li/ul//a/span"));
    }

    /**
     * Access main header - category in side bar. Also can collapse and Expand side
     * bar item
     *
     * @param mainHeader
     * @return
     * @author nauman.shahid
     */
    public WebElement getSideBarHeader(String mainHeader) {
        return I.amPerforming().getElementReference().of(getSideBarHeaderLocator(mainHeader));
    }

    /**
     * access side bar sub header
     *
     * @param sideBarMainTab
     * @param subHeader
     * @return
     * @author nauman.shahid
     */
    public WebElement getSideBarSubHeader(String sideBarMainTab, String subHeader) {
        handleSideBarContentExpanded(subHeader);
        return I.amPerforming().getElementReference().of(getSideBarSubHeaderLocator(sideBarMainTab, subHeader));
    }

    /**
     * access side bar sub header detail
     *
     * @param subHeader
     * @param subHeaderContent
     * @return
     * @author nauman.shahid
     */
    public WebElement getSideBarContent(String subHeader, String subHeaderContent) {
        handleSideBarContentExpanded(subHeader);
        return I.amPerforming().getElementReference().of(getSideBarContentLocator(subHeader, subHeaderContent));
    }

    /**
     * access side bar by clicking expand
     *
     * @param subHeader
     * @return
     * @author spandana.garikipati
     * @modified john.phillips - 02/19/2019 - Added check to skip expansion if in San Diego
     */
    public void handleSideBarContentExpanded(String subHeader) {
        String sideBarHeader = "//div[@id='sidebar-wrapper']//*[text()='" + subHeader + "']/ancestor::li[2]";
        String sideBarSubHeader = "//div[@id='sidebar-wrapper']//*[text()='" + subHeader + "']/ancestor::li[1]";

        if (I.amPerforming().checkToSee().IsElementPresentQuick(By.xpath(sideBarHeader))
                && !I.amPerforming().checkToSee().IsElementPresentQuick(By.xpath(sideBarHeader + "[contains(@class, 'clicked')]"))) {
            I.amPerforming().click().on(By.xpath(sideBarHeader + "/a"));
        }

        if (I.amPerforming().checkToSee().IsElementPresentQuick(By.xpath(sideBarSubHeader))
                && !I.amPerforming().checkToSee().IsElementPresentQuick(By.xpath(sideBarSubHeader + "[contains(@class,' clicked')]"))) {
            I.amPerforming().click().on(By.xpath(sideBarSubHeader + "/a"));
        }
    }

    /**
     * Access main header - category in side bar. Also can collapse and Expand side
     * bar item
     *
     * @param mainHeader
     * @return
     * @author nauman.shahid
     */
    public By getSideBarHeaderLocator(String mainHeader) {
        return By.xpath("//div[@id='sidebar-wrapper']//div/p/span[" + I.amPerforming().sanityOfXpathTo().contains("text()", mainHeader) + "]");
    }

    /**
     * access side bar sub header
     *
     * @param sideBarMainTab
     * @param subHeader
     * @return
     * @author nauman.shahid
     */
    public By getSideBarSubHeaderLocator(String sideBarMainTab, String subHeader) {
        return By.xpath(""
                + "//div[@id='sidebar-wrapper']//*[" + I.amPerforming().sanityOfXpathTo().contains("text()", sideBarMainTab) + "]/../.."
                + "//*[" + I.amPerforming().sanityOfXpathTo().equals("text()", subHeader) + "]"
                + " | "
                + "//div[@id='sidebar-wrapper']//*[" + I.amPerforming().sanityOfXpathTo().contains("text()", sideBarMainTab) + "]/../../.."
                + "//*[" + I.amPerforming().sanityOfXpathTo().equals("text()", subHeader) + "]");
    }

    /**
     * access side bar sub header detail
     *
     * @param subHeader
     * @param subHeaderContent
     * @return
     * @author nauman.shahid
     */
    public By getSideBarContentLocator(String subHeader, String subHeaderContent) {
        return By.xpath("//div[contains(@class,'sidebar-wrapper')]//a/span[" + I.amPerforming().sanityOfXpathTo().equals("text()", subHeader) + "]/parent::a/parent::li[contains(@class,'subMenu') or contains(@class, componentTitle)]//li/a/span[" + I.amPerforming().sanityOfXpathTo().equals("text()", subHeaderContent) + "] " +
                "| //div[contains(@class,'sidebar-wrapper')]//div[@class='panel-heading']//*[" + I.amPerforming().sanityOfXpathTo().contains("normalize-space()", subHeader) + "]//ancestor::div[contains(@class,'sidebar-panel-body') or contains(@class,'panel-sidebar')]//*//a[" + I.amPerforming().sanityOfXpathTo().equals("text()", subHeaderContent) + "]");
    }

    /**
     * @return assert if accordion sub header is displayed
     *
     * @param sideBarCategory
     * @param accordianSubHeaderDetail
     * @author ashwini.mahore
     */
    public void assertSubHeaderContentDisplayed(String usage, String sideBarCategory, String accordianSubHeaderDetail) {
        if (usage.equalsIgnoreCase("see")) {
            Assert.assertTrue(isSideBarAccordionSubHeaderDisplayed(sideBarCategory, accordianSubHeaderDetail));
        } else if (usage.equalsIgnoreCase("do not see")) {
            Assert.assertFalse(isSideBarAccordionSubHeaderDisplayed(sideBarCategory, accordianSubHeaderDetail));
        }
    }

    /**
     * @param sideBarCategory
     * @param accordianSubHeaderDetail
     * @return true if accordion sub header is displayed
     * @author ashwini.mahore
     */
    private boolean isSideBarAccordionSubHeaderDisplayed(String sideBarCategory, String accordianSubHeaderDetail) {
        boolean flag = false;
        try {
            if (I.amPerforming().checkToSee().isDisplayed(getSideBarAccordianSubHeaderContent(sideBarCategory, accordianSubHeaderDetail))) {
                flag = true;
            }
        } catch (Exception e) {

        }
        return flag;
    }

    /**
     * access side bar sub header detail
     *
     * @param sideBarCategory
     * @param accordianSubHeaderDetail
     * @author ashwini.mahore
     */
    public WebElement getSideBarAccordianSubHeaderContent(String sideBarCategory, String accordianSubHeaderDetail) {
        return getSideBarContent(sideBarCategory, accordianSubHeaderDetail);
    }

    /**
     * click on global search all
     *
     * @param dropDownValue
     * @author ashwini.mahore
     */
    public void clickOnGlobalSearchAll(String dropDownValue) {
        I.amPerforming().click().on(ByUsing.xpath("//select[@id='selectSearchId']/option[text()='" + dropDownValue + "']"));
    }
}
