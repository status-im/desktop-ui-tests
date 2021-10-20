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


    function test_case1_statusChatInfoButton_clicked() {

        var statusChatInfoButton = popupComponent.createObject(window)
        statusChatInfoButton.title = "Status-Chat-Info-Button"
        wait(2000)
        statusChatInfoButtonClickedSpy.target = statusChatInfoButton
        compare(statusChatInfoButtonClickedSpy.count, 0)
        mouseClick(statusChatInfoButton, 1, 1, Qt.LeftButton)
        wait(2000)
        compare(statusChatInfoButtonClickedSpy.count, 1, "Status Chat info button was not clicked")
        statusChatInfoButton.destroy()
    }

    function test_case2_statusChatInfoButton_unmuted() {
        var statusChatInfoButton = popupComponent.createObject(window)
        statusChatInfoButton.title = "#public"
        statusChatInfoButton.muted = true
        wait(2000)
        var mutedButton = helpers.getObjectByObjectName(statusChatInfoButton, "mutedIcon")
        statusChatInfoButtonUnmuteSpy.target = statusChatInfoButton
        compare(statusChatInfoButtonUnmuteSpy.count, 0)
        mouseClick(mutedButton, 2, 2, Qt.LeftButton)
        wait(2000)
        compare(statusChatInfoButtonUnmuteSpy.count, 1, "Muted button is not clicked")
        statusChatInfoButton.destroy()
    }

    function test_case3_statusChatInfoButton_pinned() {

        var statusChatInfoButton = popupComponent.createObject(window)
        statusChatInfoButton.title = "#community-channel"
        statusChatInfoButton.pinnedMessagesCount = 2
        wait(2000)
        var pinButtonCounter = helpers.getObjectByObjectName(statusChatInfoButton, "pinMessagesCounterSensor")
        pinnedMessagesClickedSpy.target = statusChatInfoButton
        compare(pinnedMessagesClickedSpy.count, 0)
        mouseClick(pinButtonCounter, 1, 1, Qt.LeftButton)
        wait(2000)
        compare(pinnedMessagesClickedSpy.count, 1, "Pin counter is not clicked")
        statusChatInfoButton.destroy()

    }

}

