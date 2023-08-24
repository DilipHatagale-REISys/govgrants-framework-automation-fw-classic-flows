package com.helperPackage.govgrants;

import com.helperPackage.handlers.govgrants;
import com.helperPackage.actionsfactory.api.ByUsing;
import com.helperPackage.register.I;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebElement;

public final class LibraryFiles {

    /******* "Key Methods with complete functionality - Public" *****************/

    /**
     * perform click on expand icon at Library / folder - Home phase
     *
     * @param libraryFileFolderName
     */
    public void clickOnExpandIconAtLibraryFolder(String libraryFileFolderName) {
        I.amPerforming().click().on(By.xpath("//*[text() ='" + libraryFileFolderName + "']//parent::div//button[@title='Expand Folder']"));
    }

    /**
     * perform click on dropdown icon at Library / folder / file - Home phase
     *
     * @param libraryFileFolderName
     */
    public void clickOnDropdownIconAtLibraryFolderFile(String libraryFileFolderName) {
        I.amPerforming().click().on(By.xpath("//*[text() ='" + libraryFileFolderName + "']//parent::div//button[@aria-expanded='false']"));
    }

    /**
     * enter value in fields on modal while adding/editing folders/ files in library - home phase
     *
     * @param value
     * @param fieldName
     */
    public void enterValueInFieldsAtModalWindow(String value, String fieldName) {
        if (fieldName.equalsIgnoreCase("Description")) {
            WebElement enterDescription = I.amPerforming().getElementReference().of(By.xpath("//label[text()='" + fieldName + "']/following-sibling::div//textarea"));
            I.amPerforming().textInput().toClear(enterDescription);
            I.amPerforming().textInput().in(enterDescription, value);
        } else {
            WebElement enterFieldValue = I.amPerforming().getElementReference().of(By.xpath("//label[text()='" + fieldName + "']/following-sibling::div//input"));
            I.amPerforming().textInput().toClear(enterFieldValue);
            I.amPerforming().textInput().in(enterFieldValue, value);
        }
    }

    /**
     * Complete steps to upload file in Library files - Home phase
     *
     * @param attachmentName
     * @author ashwini.mahore
     * @modifier ashwini.mahore (added xpath to upload file in special sharing condition)
     * @modifier monu.kumar (added xpath in or condition)
     */
    public void uploadFileInLibraryAtHomePhase(String attachmentName, String usage) {
        By attachmentChooseFilePath = ByUsing.xpath("//input[@type='file'] | //input[@type='file' and @title='Attachment']");
        if (usage.contains("sharing")) {
            attachmentChooseFilePath = ByUsing.xpath("//div[contains(@class,'GNTFileUploadFromComputer')]//input[@type='file']");
        }
        String defaultFilePath = System.getProperty("user.dir") + "/src/main/resources/";
        I.amPerforming().textInput().in(attachmentChooseFilePath, defaultFilePath + attachmentName);
    }

    /**
     * perform click on select/change folder at add file modal - Library Files Home phase
     */
    public void clickOnSelectChangeFolderInAddFileModalUnderLibrary() {
        I.amPerforming().click().on(By.xpath("//*[contains(normalize-space(text()),'Select/Change Folder')]"));
    }

    /**
     * steps to select/change folder at add file modal - Library Files Home phase
     *
     * @param folderName
     */
    public void selectOrChangeFolderInAddFileModalUnderLibrary(String folderName) {
        I.amPerforming().click().on(By.xpath("//div[@id='modaltemp']//span[text()='" + folderName + "']"));
    }

    /**
     * steps to perform quick search under Library Files tab- Home phase
     *
     * @param searchValue
     */
    public void performQuickSearchUnderFilesLibrary(String searchValue) {
        By enterText = By.xpath("//input[@type='search']");
        I.amPerforming().textInput().toClear(enterText);
        I.amPerforming().textInput().in(enterText, searchValue);
    }

    /**
     * select classification at upload file modal window - Library files Home phase/record level
     *
     * @param classification
     */
    public void selectClassificationAtUploadFileModalUnderLibrary(String classification) {
        I.amPerforming().click().on(getClassificationAtUploadFileModalUnderLibrary(classification));
    }

    /**
     * get classification at upload file modal window - Library files Home phase/record level
     *
     * @param classification
     */
    public WebElement getClassificationAtUploadFileModalUnderLibrary(String classification) {
        By selectValueFromDropdown = By.xpath("//select[@name='Classification']//option[text()='" + classification + "']");
        return I.amPerforming().getElementReference().of(selectValueFromDropdown);
    }

    /**
     * click on tab to select 'upload file from computer'/'upload file from library workspace' upload file modal window - Library files record level
     *
     * @param tabName
     */
    public void clickOnTabAtFilesLibraryUploadModal(String tabName) {
        I.amPerforming().click().on(getTabInsideAddFileModal(tabName));
    }

    /**
     * get label of tab under Add file modal window - Library files record level
     *
     * @param tabName
     */
    public WebElement getTabInsideAddFileModal(String tabName) {
        return I.amPerforming().getElementReference().of(By.xpath("//li[@title='" + tabName + "']"));
    }

    /**
     * @param tableId - flex table id.
     *                This method is used to upload the first attachment from the flex table present after clicking on option 'Upload File from Library' on modal
     * @author jitendra.pisal
     */
    public void uploadFilesFromLibrary(String usage, String tableId, String classificationType) {
        By uploadFileFromLibrary = By.xpath("//*[" + I.amPerforming().sanityOfXpathTo().equals("@title", "Upload File from Library") + "]/a");
        I.amPerforming().click().on(uploadFileFromLibrary);
        if (usage != null && usage.contains("classification")) {
            By search = By.xpath("//div[@id='" + tableId + "']//input[@type='search']");
            I.amPerforming().textInput().in(search, classificationType);
            By searchIcon = By.xpath("//div[@id='" + tableId + "']//i[@class='fa fa-search']");
            I.amPerforming().click().on(searchIcon);
            I.amPerforming().waitFor().makeThreadSleep(3000);
        }
        By selectFirstFileFromList = By.xpath("//*[@id='" + tableId + "']//table//tbody//tr[1]//td[1]");
        I.amPerforming().click().on(selectFirstFileFromList);
        govgrants.perform().modal().clickModalContentSpecificButton("Attach");
    }

    /**
     * click on button to attach file at collab - my feed section
     *
     * @param buttonName
     * @author ashwini.mahore
     */
    public void clickOnButtonAtCollab(String buttonName) {
        WebElement getButtonAtCollabPhase = I.amPerforming().getElementReference().of(ByUsing.xpath("//div[contains(@class,'createCollabComment') and contains(@class,'active')]//a[text()='" + buttonName + "']"));
        I.amPerforming().click().on(getButtonAtCollabPhase);
    }

    /**
     * perform click on close icon under add new folder/Edit Folder/upload File modal at library
     *
     * @param icon
     * @param modalTitle
     * @author ashwini.mahore
     */
    public void clickOnCloseIconAtLibraryFolderFileModal(String icon, String modalTitle) {
        I.amPerforming().click().on(ByUsing.xpath("//p[text()='" + modalTitle + "']/ancestor::div[(@aria-hidden)]//*[contains(normalize-space(text()),'" + icon + "')]"));
    }

    /**
     * get sharing options at upload file modal window - Library files Home phase/record level
     *
     * @param sharingOptions
     * @author ashwini.mahore
     */
    public WebElement getSharingOptionsAtUploadFileModalUnderLibrary(String sharingOptions) {
        By selectValueFromDropdown = By.xpath("//select[@name='SharingOptions']//option[text()='" + sharingOptions + "']");
        return I.amPerforming().getElementReference().of(selectValueFromDropdown);
    }

    /**
     * perform press enter on keyboard
     */
    public void pressKeyFromkeyboard() {
        I.amPerforming().addOnsTo().getKeyBoard().keyPress(Keys.ENTER);
    }
}