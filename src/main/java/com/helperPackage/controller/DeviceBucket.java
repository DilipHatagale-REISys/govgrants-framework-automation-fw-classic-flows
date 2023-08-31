/*
 * Copyright 2020
 *
 * This file is part of Testing Blaze Automation Solution.
 *
 * Testing Blaze Automation Solution is licensed under the Apache License, Version
 * 2.0 (the "License"); you may not use this file except
 * in compliance with the License. You may obtain a copy
 * of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on
 * an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
package com.helperPackage.controller;

import com.helperPackage.devices.*;
import com.helperPackage.register.EnvironmentFactory;
import com.helperPackage.devices.*;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;


/**
 * @author nauman.shahid
 * Handles pico container dependency for dependency injection
 */


public final class DeviceBucket implements qrYoTsOWwA {
    private final qrYoTsOWwA delegate;

    public DeviceBucket() {
        switch (EnvironmentFactory.getDevice().toLowerCase()) {
            case "firefox":
                delegate = new FireFoxManager();
                break;
            case "chrome":
                delegate = new ChromeManager();
                break;
            case "ie":
                delegate = new IEManager();
                break;
            case "ie-32":
                delegate = new IEManager();
                break;
            case "android":
                delegate = new AndroidManager();
                break;
            case "ios":
                delegate = new IOSManager();
                break;
            case "edge":
                delegate = new EdgeManager();
                break;
            case "edge-32":
                delegate = new EdgeManager();
                break;
            case "safari":
                delegate = new SafariManager();
                break;
            default:
                delegate = new ChromeManager();
        }
    }

    @Override
    public WebDriver getDriver() {
        return delegate.getDriver();
    }

    @Override
    public void setupController() {
        delegate.setupController();
    }

    @Override
    public void stopServiceProvider() {
        delegate.stopServiceProvider();
    }
}
