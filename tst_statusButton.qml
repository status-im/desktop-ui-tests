import QtQuick 2.14
import QtQuick.Window 2.14
import QtTest 1.14

import "base"
import "status-desktop/ui/StatusQ/src/StatusQ/Controls" as DesktopControls

WindowTestCase {
    name: "statusButton"
    when: windowShown

    Helpers { id: helpers }


    Component {
        id: popupComponent
        DesktopControls.StatusButton {
            id: statusButton
        }
    }


    SignalSpy {
        id: statusButtonClickedSpy
        signalName: "clicked"
    }

    SignalSpy {
        id: statusButtonReleasedSpy
        signalName: "released"
    }

    SignalSpy {
        id: statusButtonPressedSpy
        signalName: "pressed"
    }

    SignalSpy {
        id: statusButtonPressedAndHoldSpy
        signalName: "pressAndHold"
    }



    function initTestCase() {
        window.show()
    }

    function cleanupTestCase() {
        window.close()
    }


    function test_case1_statusButton_clicked() {

        var statusButton = popupComponent.createObject(window)
        statusButton.text = "Status Button"
        wait(2000)
        statusButtonClickedSpy.target = statusButton
        compare(statusButtonClickedSpy.count, 0)
        mouseClick(statusButton, 1, 1, Qt.LeftButton)
        wait(2000)
        compare(statusButtonClickedSpy.count, 1, "Status button was not clicked")
        statusButton.destroy()
    }

    function test_case2_statusButton_pressed() {

        var statusButton = popupComponent.createObject(window)
        statusButton.text = "Status Button"
        wait(2000)
        statusButtonPressedSpy.target = statusButton
        compare(statusButtonPressedSpy.count, 0)
        mousePress(statusButton, 1, 1, Qt.LeftButton)
        wait(2000)
        compare(statusButtonPressedSpy.count, 1, "Status button was not pressed")
        statusButton.destroy()

    }

    function test_case3_statusButton_pressedAndHold() {

        var statusButton = popupComponent.createObject(window)
        statusButton.text = "Status Button"
        wait(2000)
        statusButtonPressedAndHoldSpy.target = statusButton
        compare(statusButtonPressedAndHoldSpy.count, 0)
        mousePress(statusButton, 1, 1, Qt.LeftButton, Qt.NoModifier, 1000)
        wait(2000)
        compare(statusButtonPressedAndHoldSpy.count, 1, "Status button was not press and hold for 1000 ms")
        statusButton.destroy()

    }

    function test_case4_statusButton_released() {

        var statusButton = popupComponent.createObject(window)
        statusButton.text = "Status Button"
        wait(2000)
        statusButtonReleasedSpy.target = statusButton
        compare(statusButtonReleasedSpy.count, 0)
        mousePress(statusButton, 1, 1, Qt.LeftButton, Qt.NoModifier, 1000)
        mouseRelease(statusButton, 1, 1, Qt.LeftButton)
        wait(2000)
        compare(statusButtonReleasedSpy.count, 1, "Status button was not released")
        statusButton.destroy()

    }



}
