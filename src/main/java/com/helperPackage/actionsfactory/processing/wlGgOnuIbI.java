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
package com.helperPackage.actionsfactory.processing;

import com.helperPackage.objects.InstanceRecording;
import com.helperPackage.register.I;
import com.helperPackage.report.LogLevel;
import com.helperPackage.actionsfactory.abstracts.ActionProcessing;
import com.helperPackage.actionsfactory.type.Is;
import com.helperPackage.controller.DeviceBucket;

import java.util.ArrayList;
import java.util.List;

import static com.helperPackage.misclib.ConsoleFormatter.COLOR.GREEN;
import static com.helperPackage.misclib.ConsoleFormatter.setBoldText;
import static com.helperPackage.misclib.ConsoleFormatter.setTextColor;

public class wlGgOnuIbI {
    public final Is is = InstanceRecording.getInstance(Is.class);
    private final DeviceBucket device = InstanceRecording.getInstance(DeviceBucket.class);
    List<String> windowHandles = new ArrayList<>();

    // Change it to windows handler and use LocatorProcessing updated abstract

    public ActionProcessing preProcessingTestBlaze = () -> {
        windowHandles.clear();
        windowHandles.addAll(I.amPerforming().switchTo().getWindowsHandlers());
    };

    public ActionProcessing postProcessingTestBlaze = () -> {
        //PageLoadProcessing.documentLoad.status("before action processing");
        List<String> newWindowHandles = I.amPerforming().switchTo().getWindowsHandlers();
        if (newWindowHandles.size() != windowHandles.size()) {
            for (int i = 0; i < newWindowHandles.size(); i++) {
                if (!windowHandles.contains(newWindowHandles.get(i))) {
                    switchToWindowHandler(i);
                    I.amPerforming().updatingOfReportWith().write(LogLevel.TEST_BLAZE_INFO,  setBoldText(setTextColor(GREEN, "Switched to a new Window ")));
                    break;
                }
            }
        }
    };

    /**
     * switch to window handler
     *
     * @param handlerNumber : Usually child number is "1" and parent number is "0". However,
     *                      method is dyanmic to handle any child number
     */
    private void switchToWindowHandler(int handlerNumber) {
        device.getDriver().switchTo().window(getWindowsHandlers().get(handlerNumber));
    }

    /**
     * Windows handlers
     */
    public ArrayList<String> getWindowsHandlers() {
        return new ArrayList<String>(device.getDriver().getWindowHandles());
    }
}
