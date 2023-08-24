package com.helperPackage.govgrants;

import com.helperPackage.register.I;
import org.openqa.selenium.By;

public final class Charts {

    /******* "Key Methods with complete functionality - Public" *****************/

    /**
     * click on menu of charts
     *
     * @param chartName
     */
    public void clickChartMenuIcon(String chartName, String iconTitle) {
        By chartMenuDropdown = By.xpath(
                "//div[@class='chartTitle']/a[@title='" + chartName + "']/../..//a[@title='" + iconTitle + "']");
        I.amPerforming().click().on(chartMenuDropdown);
    }

    /**
     * select specific value from specific chart
     *
     * @param chartName
     * @param valueToSelect
     */
    public void selectAnyItemFromChartsMenu(String chartName, String valueToSelect) {
        By chartMenuItem = By.xpath("//div[@class='chartTitle']/a[@title='" + chartName
                + "']/../..//li//a[@title='" + valueToSelect + "']");
        I.amPerforming().click().on(chartMenuItem);
    }

    /**
     * perform click on expected link on Task Summary charts
     *
     * @param linkName
     * @param chartName
     */
    public void clickOnExpectedLinkInsideTaskSummary(String linkName, String chartName) {
        By taskSummaryLink = By.xpath("//div[@class='panel border-add']//*[text()='" + chartName + "']/../following-sibling::div//li//span[text()='" + linkName + "']/../a");
        I.amPerforming().click().on(taskSummaryLink);
    }

    /**** Enhanced Charts *****/
    /**
     * perform quick search without click on search icon inside enhanced charts (show all data) modal
     *
     * @param searchInput
     * @param chartTableId
     * @author Ashwini.Mahore
     */
    public void performQuickSearchInsideChartsModal(String searchInput, String chartTableId) {
        By searchInputBox = By.xpath("//input[@id='" + chartTableId + "']");
        I.amPerforming().textInput().toClear(searchInputBox);
        I.amPerforming().textInput().in(searchInputBox, searchInput);
    }

    /**
     * perform mouse hover on enhanced charts
     *
     * @param chartId
     * @param chartsType
     */
    public void getHoveringOnEnhancedCharts(String chartId, String chartsType) {
        I.amPerforming().scroll().toMoveToElement(enhancedCharts(chartId, chartsType), false);
    }

    /**
     * perform mouse hover on specific enhanced charts (need to modify this function in future)
     *
     * @param chartId
     * @param chartsType
     */
    public void getHoveringOnSpecificEnhancedCharts(String chartId, String chartsType) {
        I.amPerforming().getElementReference().of(By.xpath("//div[@id='" + chartId + "']"));
        I.amPerforming().waitFor().makeThreadSleep(5000);
        I.amPerforming().scroll().withMouseToElement(enhancedCharts(chartId, chartsType));
        I.amPerforming().scroll().withMouseToElement(enhancedCharts(chartId, chartsType));
    }

    /**
     * It will return the enhanced charts which will take parameter as charts id and charts type (means class attribute which will differentiate the multiple charts)
     *
     * @param chartId
     * @param chartsType
     * @return
     */
    public By enhancedCharts(String chartId, String chartsType) {
        return By.xpath("//div[@id='" + chartId + "']//*[local-name()='path'][contains(@class,'" + chartsType + "')]");
    }
}