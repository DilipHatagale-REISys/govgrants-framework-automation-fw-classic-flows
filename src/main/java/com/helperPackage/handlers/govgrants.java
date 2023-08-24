package com.helperPackage.handlers;

import com.helperPackage.objects.InstanceRecording;

public class govgrants {
    public static GovGrantsLibrary perform() {
        return InstanceRecording.getInstance(GovGrantsLibrary.class);
    }
}
