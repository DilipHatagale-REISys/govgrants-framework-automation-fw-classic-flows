package com.helperPackage.govgrants;


import com.helperPackage.exception.TestingBlazeCustomException;
import com.helperPackage.objects.Elements;
import com.helperPackage.register.I;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.util.List;

public class QuickSearch {
    private final By
            searchInput = By.cssSelector("div>div.quick-search>div>input"),
            quickSearchButton = By.cssSelector("div.input-group-btn>a>i.fa.fa-search"),
            globalSearchInput = By.cssSelector("div.input-group>input#isTypeNotAhead"),
            globalSearchButton = By.cssSelector("div.input-group>a>i.fa.fa-search");

    /******* "Key Methods with complete functionality - Public" *****************/

    /**
     * perform complete quick search in flex
     *
     * @return
     * @author nauman.shahid
     */
    public void performQuickSearch(String searchTerm) {
        try {
            I.amPerforming().textInput().toClear(searchInput);
            I.amPerforming().textInput().in(searchInput, searchTerm);
            I.amPerforming().click().on(quickSearchButton);
        } catch (Exception e) {
            I.amPerforming().textInput().toClear(searchInput);
            I.amPerforming().textInput().in(searchInput, searchTerm);
            I.amPerforming().click().on(quickSearchButton);
        }
    }

    /**
     * perform complete quick search in globalquick search above to sidebar links
     *
     * @return
     * @author Monu.Kumar
     */
    public void performGlobalQuickSearch(String searchTerm) {
        try {
            I.amPerforming().textInput().toClear(globalSearchInput);
            I.amPerforming().textInput().in(globalSearchInput, searchTerm);
            I.amPerforming().click().on(globalSearchButton);
        } catch (Exception e) {
            I.amPerforming().textInput().toClear(globalSearchInput);
            I.amPerforming().textInput().in(globalSearchInput, searchTerm);
            I.amPerforming().click().on(globalSearchButton);
        }
    }

    /**
     * get generic quick search
     *
     * @return
     * @author nauman.shahid
     */
    public WebElement getQuickSearch() {
        return I.amPerforming().getElementReference().of(searchInput);
    }

    /**
     * perform complete quick search in flex based on table id
     *
     * @param tableId
     * @param searchTerm
     * @return
     * @author nauman.shahid
     */
    public void performTableSpecificQuickSearch(String tableId, String searchTerm) throws TestingBlazeCustomException {
        boolean flag = false;
        By searchInputBox = By.cssSelector("div#" + tableId + " div>div>input");
        List<Elements> quickSearchElements = I.amPerforming().getElementReference().forListOfElements().of(searchInputBox);
        for (Elements quickSearch : quickSearchElements) {
            flag = handleQuickSearch(quickSearch, tableId, searchTerm);
            if (flag) {
                break;
            }
        }
        if (!flag) {
            throw new TestingBlazeCustomException("Quick search not found with locator " + searchInputBox);
        }

    }

    /**
     * perform complete quick search on modal in flex based on table id
     *
     * @return
     * @author nauman.shahid
     * @modifier meenakshi.jha added xpath
     */
    public void performModalSpecificQuickSearch(String tableId, String searchTerm) {
        By searchInputBox = By.cssSelector("div#" + tableId + " div>input");

        try {
            I.amPerforming().textInput().toClear(searchInputBox);
            I.amPerforming().textInput().in(searchInputBox, searchTerm);
            I.amPerforming().click().withJavaScript(By.cssSelector("div#" + tableId + " a>i.fa.fa-search,div#" + tableId + " button>i.fa.fa-search"));
        } catch (Exception e) {
            I.amPerforming().textInput().toClear(searchInputBox);
            I.amPerforming().textInput().in(searchInputBox, searchTerm);
            I.amPerforming().click().on(By.cssSelector("div#" + tableId + " a>i.fa.fa-search"));
        }
    }

    /**
     * get quick search specific to a table
     *
     * @param tableId
     * @return
     * @author nauman.shahid
     */
    public WebElement getTableSpecificQuickSearch(String tableId) {
        By quickSearchInput = By.cssSelector("div#" + tableId + " div>div>input");

        return I.amPerforming().getElementReference().of(quickSearchInput);
    }

    /**
     * Handles search for enahnces grid
     *
     * @param tableDivId
     * @param anyUniqueColumnValue
     * @param searchTerm
     * @return
     * @author nauman.shahid
     */
    public void performEnhancedGridSearch(String tableDivId, String anyUniqueColumnValue, String searchTerm) {
        String quickSearchInput = "//div[@id='" + tableDivId + "']//tbody//td//*[text()='"
                + anyUniqueColumnValue + "']/ancestor::tbody[1]//tr[2]/td";

        try {
            I.amPerforming().textInput().toClear(By.xpath(quickSearchInput + "//input[contains(@aria-label,'Quick Search')]"));
            I.amPerforming().textInput().in(By.xpath(quickSearchInput + "//input[contains(@aria-label,'Quick Search')]"), searchTerm);
            I.amPerforming().click().on(By.xpath(quickSearchInput + "//a/i[@class='fa fa-search']"));
        } catch (Exception e) {
            I.amPerforming().textInput().toClear(By.xpath(quickSearchInput + "//input[contains(@aria-label,'Quick Search')]"));
            I.amPerforming().textInput().in(By.xpath(quickSearchInput + "//input[contains(@aria-label,'Quick Search')]"), searchTerm);
            I.amPerforming().click().on(By.xpath(quickSearchInput + "//a/i[@class='fa fa-search']"));
        }
    }

    /**
     * Return true if search is completed successfully
     *
     * @param searchElement
     * @param tableId
     * @param searchTerm
     * @modifier Monu.Kumar
     * <p>
     *     Modified css path at line 166 and 172
     * </p>
     * @return
     */
    private boolean handleQuickSearch(Elements searchElement, String tableId, String searchTerm) {
        boolean flag = false;

        try {
            searchElement.clearText();
            searchElement.enterText(searchTerm);
            I.amPerforming().click().on(By.cssSelector("div#" + tableId + " i.fa.fa-search, div#" + tableId + " div.input-group-btn>button"));
            flag = true;
        } catch (Exception e) {
            try {
                searchElement.clearText();
                searchElement.enterText(searchTerm);
                I.amPerforming().click().on(By.cssSelector("div#" + tableId + " i.fa.fa-search, div#" + tableId + " div.input-group-btn>button"));
                flag = true;
            } catch (Exception f) {
                /* Ignore Exception */
            }
        }
        return flag;
    }

}
