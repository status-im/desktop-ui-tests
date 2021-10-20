import QtQuick 2.14
import QtTest 1.14

import "base"

import StatusQ.Components 0.1

WindowTestCase {
    name: "StatusListItem test"

    SignalSpy {
        id: clickedSpy
        target: listItem
        signalName: "clicked"
    }

    SignalSpy {
        id: titleClickedSpy
        target: listItem
        signalName: "titleClicked"
    }

    StatusListItem {
        id: listItem

        parent: windowContent

        itemId: "someId"
        title: "Title"
        subTitle: "Subtitle"
    }

    function test_clickFunctions() {
        // Verify than signal exists
        verify(clickedSpy.valid, "Signal " + clickedSpy.signalName + "is not valid")
        verify(titleClickedSpy.valid, "Signal " + titleClickedSpy.signalName + "is not valid")

        compare(clickedSpy.count, 0)
        mouseClick(listItem, 1, 1, Qt.LeftButton)
        compare(clickedSpy.count, 1, "Signal clicked is not called")

        compare(titleClickedSpy.count, 0)
        mouseClick(listItem, listItem.leftPadding + 1, listItem.implicitHeight / 2, Qt.LeftButton)
        compare(titleClickedSpy.count, 1, "Signal titleClicked is not called");
    }
}
