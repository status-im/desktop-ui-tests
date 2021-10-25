import QtQuick 2.14
import QtTest 1.14

import StatusQ.Controls 0.1

import "base"

WindowTestCase {
    name: "StatusSwitch test"

    SignalSpy {
        id: clickSpy
        target: statusSwitch
        signalName: "clicked"
    }

    StatusSwitch {
        id: statusSwitch
        parent: windowContent
        text: "unit test"
    }

    function test_clickOnSwitch() {
        verify(clickSpy.valid, "Signal clicked not valid")
        verify(!statusSwitch.checked, "Switch is checked on init")
        compare(statusSwitch.text, "unit test", "Text property is not working")

        compare(clickSpy.count, 0, "Signal spy is not cleared")
        mouseClick(statusSwitch, 1, 1, Qt.LeftButton)
        compare(clickSpy.count, 1, "Signal is not emited")

        verify(statusSwitch.checked, "Switch is not checked")
    }
}
