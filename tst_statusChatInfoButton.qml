import QtQuick 2.14
import QtQuick.Window 2.14
import QtTest 1.14

import "base"
import StatusQ.Controls 0.1
import StatusQ.Popups 0.1

WindowTestCase {
    name: "statusChatInfoButton test"

    Helpers { id: helpers }

    SignalSpy {
        id: clickedSpy
        target: chatInfoButton
        signalName: "clicked"
    }

    SignalSpy {
        id: unmuteSpy
        target: chatInfoButton
        signalName: "unmute"
    }

    SignalSpy {
        id: pinnedCounterSpy
        target: chatInfoButton
        signalName: "pinnedMessagesCountClicked"
    }

    StatusChatInfoButton {
        id: chatInfoButton
        parent: windowContent
        title: "#public-chat"
        subTitle: "chat-about-everything"
        muted: true
        pinnedMessagesCount: 3
    }

    function test_case1_statusChatInfoButton_signals_valid() {

        // checking if signals are present
        verify(clickedSpy.valid, "Signal " + clickedSpy.signalName + "is not found")
        verify(unmuteSpy.valid, "Signal " + unmuteSpy.signalName + "is not found")
        verify(pinnedCounterSpy.valid, "Signal " + pinnedCounterSpy.signalName + "is not found")
    }

    function test_case2_statusChatInfoButton_clicked() {

        compare(clickedSpy.count, 0)
        mouseClick(chatInfoButton, 1, 1, Qt.LeftButton)
        wait(10000)
        compare(clickedSpy.count, 1, "Status Chat info button was not clicked")
    }

    function test_case3_statusChatInfoButton_unmuted() {

        unmuteSpy.clear()
        var mutedButton = helpers.getObjectByObjectName(chatInfoButton, "mutedIcon")
        verify(mutedButton)
        compare(unmuteSpy.count, 0)
        mouseClick(mutedButton, 2, 2, Qt.LeftButton)
        compare(unmuteSpy.count, 1, "Muted button is not clicked")
    }

    function test_case4_statusChatInfoButton_pinned() {

        pinnedCounterSpy.clear()
        var pinButtonCounter = helpers.getObjectByObjectName(chatInfoButton, "pinMessagesCounterSensor")
        verify(pinButtonCounter)
        compare(pinnedCounterSpy.count, 0)
        mouseClick(pinButtonCounter, 1, 1, Qt.LeftButton)
        compare(pinnedCounterSpy.count, 1, "Pin counter is not clicked")

    }

}

