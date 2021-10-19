import QtQuick 2.14
import QtQuick.Window 2.14
import QtTest 1.14

import "base"
import "status-desktop/ui/StatusQ/src/StatusQ/Controls" as DesktopControls

WindowTestCase {
    name: "statusChatInfoButton"
    when: windowShown

    Helpers { id: helpers }


    Component {
        id: popupComponent
        DesktopControls.StatusChatInfoButton {
            id: statusChatInfoButton
        }
    }


    SignalSpy {
        id: statusChatInfoButtonClickedSpy
        signalName: "clicked"
    }

    SignalSpy {
        id: statusChatInfoButtonUnmuteSpy
        signalName: "unmute"
    }

    SignalSpy {
        id: pinnedMessagesClickedSpy
        signalName: "pinnedMessagesCountClicked"
    }



    function initTestCase() {
        window.show()
    }

    function cleanupTestCase() {
        window.close()
    }


    function test_case1_statusChatInfoButton_clicked() {

        var statusChatInfoButton = popupComponent.createObject(window)
        statusChatInfoButton.title = "Status Chat Info Button"
        wait(2000)
        statusChatInfoButtonClickedSpy.target = statusChatInfoButton
        compare(statusChatInfoButtonClickedSpy.count, 0)
        mouseClick(statusChatInfoButton, 1, 1, Qt.LeftButton)
        wait(2000)
        compare(statusChatInfoButtonClickedSpy.count, 1, "Status Chat info button was not clicked")
        statusChatInfoButton.destroy()
    }

}

