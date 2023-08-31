package com.helperPackage.handlers;

import com.helperPackage.govgrants.*;



public final class GovGrantsLibrary {
    private static Approvals approvals;
    private static Charts charts;
    private static FlexTable flexTable;
    private static InputForms inputForms;
    private static LibraryFiles libraryFiles;
    private static MainPage mainPage;
    private static Modal modal;
    private static PageDetails pageDetails;
    private static PhasePanel phasePanel;
    private static QuickSearch quickSearch;
    private static SideBar sideBar;
    private static Registration registration;
    private Email email = null;

    public Approvals approvals() {
        if (approvals == null) {
            approvals = new Approvals();
        }
        return approvals;
    }

    public Email email() {
        if (email == null) {
            email = new Email();
        }
        return email;
    }

    public Charts charts() {
        if (charts == null) {
            charts = new Charts();
        }
        return charts;
    }

    public FlexTable flexTable() {
        if (flexTable == null) {
            flexTable = new FlexTable();
        }
        return flexTable;
    }

    public InputForms inputForms() {
        if (inputForms == null) {
            inputForms = new InputForms();
        }
        return inputForms;
    }

    public LibraryFiles libraryFiles() {
        if (libraryFiles == null) {
            libraryFiles = new LibraryFiles();
        }
        return libraryFiles;
    }

    public MainPage mainPage() {
        if (mainPage == null) {
            mainPage = new MainPage();
        }
        return mainPage;
    }

    public Modal modal() {
        if (modal == null) {
            modal = new Modal();
        }
        return modal;
    }

    public PageDetails pageDetails() {
        if (pageDetails == null) {
            pageDetails = new PageDetails();
        }
        return pageDetails;
    }

    public PhasePanel phasePanel() {
        if (phasePanel == null) {
            phasePanel = new PhasePanel();
        }
        return phasePanel;
    }

    public QuickSearch quickSearch() {
        if (quickSearch == null) {
            quickSearch = new QuickSearch();
        }
        return quickSearch;
    }

    public SideBar sideBar() {
        if (sideBar == null) {
            sideBar = new SideBar();
        }
        return sideBar;
    }

    public Registration registration() {
        if (registration == null) {
            registration = new Registration();
        }
        return registration;
    }
}
