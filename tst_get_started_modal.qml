import QtQuick 2.14
import QtQuick.Window 2.14
import QtTest 1.14

import "base"
import "status-desktop/ui/app/AppLayouts/Onboarding/popups" as DesktopComponents


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


    function test_case_BeforeGetStartedModal_height_width() {

        var beforeGetStartedModal = popupComponent.createObject(window)
        beforeGetStartedModal.open()
        beforeGetStartedModal.title = "Before you get started ..."
        wait(2000)
        compare(beforeGetStartedModal.height, 318, "height should be 318")
        compare(beforeGetStartedModal.width, 480, "width should be 480")

        var getStartedButton = Helpers
        .getObjectByObjectName(beforeGetStartedModal, "getStartedBtn")
        verify(!!getStartedButton, "Get Started Button is not present")
        print (getStartedButton)

        beforeGetStartedModal.destroy()

    }

}

