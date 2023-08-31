package com.helperPackage.exception;

public class TestingBlazeExceptionWithoutStackTrace extends Exception {
    public TestingBlazeExceptionWithoutStackTrace(String message) {
        super(message, null, true, false);
    }
}
