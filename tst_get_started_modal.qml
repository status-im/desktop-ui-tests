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
        compare(beforeGetStartedModal.height, 318, "height should be 318")
        compare(beforeGetStartedModal.width, 480, "width should be 480")
        beforeGetStartedModal.destroy()
    }


    function test_case2_BeforeGetStartedModal_button_disabled() {

        var beforeGetStartedModal = popupComponent.createObject(window)
        beforeGetStartedModal.open()
        legacyHelpers.target = beforeGetStartedModal
        var getStartedButton = legacyHelpers.findInFooter("getStartedStatusButton")
        mouseClick(getStartedButton, getStartedButton.width/2, getStartedButton.height/2, Qt.LeftButton)
        verify(!getStartedButton.enabled, "Get Started Button is enabled")
        beforeGetStartedModal.destroy()
        }

    function test_case3_BeforeGetStartedModal_button_enabled() {
        var beforeGetStartedModal = popupComponent.createObject(window)
        beforeGetStartedModal.open()
        legacyHelpers.target = beforeGetStartedModal
        var acknowledgeCheckBox = legacyHelpers.findInContent("acknowledgeCheckBox")
        mouseClick(acknowledgeCheckBox, acknowledgeCheckBox.width/2, acknowledgeCheckBox.height/2, Qt.LeftButton)
        var termsOfUseCheckBox = legacyHelpers.findInContent("termsOfUseCheckBox")
        mouseClick(termsOfUseCheckBox, termsOfUseCheckBox.width/2, termsOfUseCheckBox.height/2, Qt.LeftButton)
        var getStartedButton = legacyHelpers.findInFooter("getStartedStatusButton")
        verify(!getStartedButton.enabled, "Get Started Button is enabled")
        mouseClick(getStartedButton, getStartedButton.width/2, getStartedButton.height/2, Qt.LeftButton)
        beforeGetStartedModal.destroy()
    }

    function test_case4_beforeGetStartedModal_TOU_click() {
        var beforeGetStartedModal = popupComponent.createObject(window)
        beforeGetStartedModal.open()
        legacyHelpers.target = beforeGetStartedModal
        var termsOfUseLink = legacyHelpers.findInContent("termsOfUseLink")
        mouseClick(termsOfUseLink, 2, 2, Qt.LeftButton)
    }

    function test_case5_beforeGetStartedModal_privacy_policy_click() {
        var beforeGetStartedModal = popupComponent.createObject(window)
        beforeGetStartedModal.open()
        legacyHelpers.target = beforeGetStartedModal
        var privacyPolicyLink = findChild(beforeGetStartedModal, "privacyPolicyLink")
        mouseClick(privacyPolicyLink, 2, 2, Qt.LeftButton)
    }

}


