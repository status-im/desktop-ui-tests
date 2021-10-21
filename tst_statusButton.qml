import QtQuick 2.14
import QtQuick.Window 2.14
import QtTest 1.14

import "base"
import StatusQ.Controls 0.1
import StatusQ.Popups 0.1

WindowTestCase {
    name: "statusButton test"
    when: windowShown


    SignalSpy {
        id: statusButtonClickedSpy
        target: statusButton
        signalName: "clicked"
    }

    SignalSpy {
        id: statusButtonReleasedSpy
        target: statusButton
        signalName: "released"
    }

    SignalSpy {
        id: statusButtonPressedSpy
        target: statusButton
        signalName: "pressed"
    }

    SignalSpy {
        id: statusButtonPressedAndHoldSpy
        target: statusButton
        signalName: "pressAndHold"
    }

    StatusButton {
        id: statusButton
        parent: windowContent
        text: "Status Button"      
    }

    function test_case1_statusButton_signals_valid() {

        // checking if signals are present

        verify(statusButtonClickedSpy.valid, "Signal " + statusButtonClickedSpy.signalName + "is not found")
        verify(statusButtonPressedSpy.valid, "Signal " + statusButtonPressedSpy.signalName + "is not found")
        verify(statusButtonPressedAndHoldSpy.valid, "Signal " + statusButtonPressedAndHoldSpy.signalName + "is not found")
        verify(statusButtonReleasedSpy.valid, "Signal " + statusButtonReleasedSpy.signalName + "is not found")
    }


    function test_case2_statusButton_clicked() {
        compare(statusButtonClickedSpy.count, 0)
        mouseClick(statusButton, 1, 1, Qt.LeftButton)
        compare(statusButtonClickedSpy.count, 1, "Status Button was not clicked")
        mouseRelease(statusButton, 1, 1, Qt.LeftButton)
    }

    function test_case3_statusButton_pressed() {
        statusButtonPressedSpy.clear()
        compare(statusButtonPressedSpy.count, 0)
        mousePress(statusButton, 5, 5, Qt.LeftButton)
        compare(statusButtonPressedSpy.count, 1, "Status Button was not pressed")

    }

    function test_case4_statusButton_pressedAndHold() {      
        statusButtonPressedAndHoldSpy.clear()
        compare(statusButtonPressedAndHoldSpy.count, 0)
        mousePress(statusButton, 5, 5, Qt.LeftButton, Qt.NoModifier, 1000)
        compare(statusButtonPressedAndHoldSpy.count, 1, "Status Button was not pressed and held")
    }


    function test_case5_statusButton_released() {
        statusButtonReleasedSpy.clear()
        mousePress(statusButton, 5, 5, Qt.LeftButton, Qt.NoModifier, 1000)
        mouseRelease(statusButton, 5, 5, Qt.LeftButton)
        compare(statusButtonReleasedSpy.count, 1, "Status Button was not released")
   }
}
