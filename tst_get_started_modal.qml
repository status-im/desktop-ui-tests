import QtQuick 2.14
import QtQuick.Window 2.14
import QtTest 1.14

import "base"
import "status-desktop/ui/onboarding" as DesktopComponents


WindowTestCase {
    name: "GetStartedModal"
    when: windowShown

    Helpers { id: helpers }


    ChatsModelData {
        id: chatsModel
    }


    Component {
        id: popupComponent
        DesktopComponents.BeforeGetStartedModal {
            id: beforeGetStartedModal
        }
    }




    function initTestCase() {
        window.show()
    }

    function cleanupTestCase() {
        window.close()
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


    function test_case2_BeforeGetStartedModal_button() {

        var beforeGetStartedModal = popupComponent.createObject(window)
        beforeGetStartedModal.open()
        beforeGetStartedModal.title = "Before you get started ..."
        wait(2000)
        var getStartedButtonExists = helpers.checkIfItemExists(beforeGetStartedModal, 340, 260)
        verify(getStartedButtonExists, true)
        beforeGetStartedModal.destroy()
        }



    }


