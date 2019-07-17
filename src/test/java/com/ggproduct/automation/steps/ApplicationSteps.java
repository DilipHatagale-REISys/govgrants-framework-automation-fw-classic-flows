package com.ggproduct.automation.steps;

import java.io.IOException;

import com.automation.rei.handlers.GovGrantsHandler;
import com.ggproduct.automation.pageobjects.ApplicationPage;
import eyethink.automation.bots.controller.Controller;
import eyethink.automation.bots.controller.CoreHandlers;
import eyethink.automation.bots.exception.EyeThinkBotsCustomException;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.Given;

public class ApplicationSteps {
    ApplicationPage applicationPage;

    public ApplicationSteps(Controller controller, CoreHandlers handler, GovGrantsHandler govgrants) {
        applicationPage = new ApplicationPage(controller, handler, govgrants);
    }

    @Given("^I qualify the announcement \"([^\"]*)\" as user \"([^\"]*)\"$")
    public void qualifyAnnouncement(String announcementName, String user, DataTable dataTable) throws EyeThinkBotsCustomException {
        applicationPage.qualifyAnnouncement(announcementName, user, dataTable);
    }

    @Given("^I create an Application from sheet \"([^\"]*)\" in excel \"([^\"]*)\"$")
    public void applicationCreation(String sheetName, String excelFileName, DataTable dataTable) {
        applicationPage.applicationCreation(sheetName, excelFileName, dataTable);
    }

    @Given("^\"([^\"]*)\" is completed by clicking \"([^\"]*)\" for Application \"([^\"]*)\" as user \"([^\"]*)\" submitted for announcement \"([^\"]*)\"$")
    public void completeReviewStepForApplication(String reviewStep, String buttonName, String applicationName,
                                                 String announcementOwner, String announcementName, DataTable dataTable) throws IOException, EyeThinkBotsCustomException {
        applicationPage.completeReviewStepForApplication(reviewStep, buttonName, applicationName, announcementOwner,
                announcementName, dataTable);
    }

    @Given("^I assign application \"([^\"]*)\" to the \"([^\"]*)\" Reviewers \"([^\"]*)\" for each step$")
    public void assignApplicationToReviewer(String applicationName, String noOfReviewers, String reviewers, DataTable dataTable) {
        applicationPage.assignApplicationToReviewer(applicationName, noOfReviewers, dataTable, reviewers.split(","));
    }

    @Given("^I choose Reviews \"([^\"]*)\" and Send for Review$")
    public void chooseAndSendReviews(String reviews, DataTable dataTable) {
        applicationPage.chooseAndSendReviews(dataTable, reviews.split(","));
    }

    @Given("^I enter Subaward Abbreviation as \"([^\"]*)\"$")
    public void enterSubAwardAbbreviationFDM(String value, DataTable dataTable) {
        applicationPage.enterSubAwardAbbreviationFDM(value, dataTable);
    }

    @Given("^I enter the recommendation in FDM in flex table with id \"([^\"]*)\" by clicking \"([^\"]*)\"$")
    public void enterRecommendationFDM(String flexTableId, String iconName, DataTable dataTable) {
        applicationPage.enterRecommendationFDM(flexTableId, iconName, dataTable);
    }
}
