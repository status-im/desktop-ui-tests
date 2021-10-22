import QtQuick 2.14
import QtQuick.Window 2.14
import QtTest 1.14

import "base"
import "status-desktop/ui/app/AppLayouts/Onboarding/popups" as DesktopComponents

WindowTestCase {
    name: "GetStartedModal tests"

    LegacyModalsHelpers { id: legacyHelpers }


    Component {
        id: popupComponent
        DesktopComponents.BeforeGetStartedModal {
            id: beforeGetStartedModal
    }

}

    function test_case1_BeforeGetStartedModal_height_width() {

        var beforeGetStartedModal = popupComponent.createObject(window)
        beforeGetStartedModal.open()
        beforeGetStartedModal.title = "Before you get started ..."
        wait(2000)
        compare(beforeGetStartedModal.height, 318, "height should be 318")
        compare(beforeGetStartedModal.width, 480, "width should be 480")
        beforeGetStartedModal.destroy()
    }


    function test_case2_BeforeGetStartedModal_button_disabled() {

        var beforeGetStartedModal = popupComponent.createObject(window)
        beforeGetStartedModal.open()
        beforeGetStartedModal.title = "Before you get started ..."
        wait(2000)
        var getStartedButton = legacyHelpers.findInContent("getStartedStatusButton")
        mouseClick(getStartedButton, 2, 2, Qt.LeftButton)
        verify(getStartedButton.enabled = false, "Get Started Button is enabled")
        beforeGetStartedModal.destroy()
        }

    function test_case3_BeforeGetStartedModal_button_enabled() {
        var beforeGetStartedModal = popupComponent.createObject(window)
        beforeGetStartedModal.open()
        wait(2000)
        var acknowledgeCheckBox = legacyHelpers.findInContent("acknowledgeCheckBox")
        mouseClick(acknowledgeCheckBox, 2, 2, Qt.LeftButton)
        var termsOfUseCheckBox = legacyHelpers.findInContent("termsOfUseCheckBox")
        mouseClick(termsOfUseCheckBox, 2, 2, Qt.LeftButton)
        var getStartedButton = legacyHelpers.findInContent("getStartedStatusButton")
        verify(getStartedButton.enabled = false, "Get Started Button is enabled")
        mouseClick(getStartedButton, 2, 2, Qt.LeftButton)
        beforeGetStartedModal.destroy()
    }

}


