/**
 * Copyright (c) 2019 ForeFront, Inc. All Rights Reserved. Subject to ForeFront, Inc. licensing.
 */

({
    showToast : function (title, message, type) {
        let toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            title: title,
            message : message,
            type: type
        });
        toastEvent.fire();
    },
});