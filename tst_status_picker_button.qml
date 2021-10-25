import QtQuick 2.14
import QtTest 1.14

import "base"

import StatusQ.Controls 0.1

WindowTestCase {
    name: "StatusPickerButton test"

    SignalSpy {
        id: clickedSpy
        target: pickerButton
        signalName: "clicked"
    }

    StatusPickerButton {
        id: pickerButton
        parent: windowContent
    }

    function test_clickOnPickerButton() {
        verify(clickedSpy.valid, "Signal not valid")

        compare(clickedSpy.count, 0, "Signal spy is not cleared")
        mouseClick(pickerButton, 1, 1, Qt.LeftButton)
        compare(clickedSpy.count, 1, "StatusPickerButton is not emit clicked")
    }
}
