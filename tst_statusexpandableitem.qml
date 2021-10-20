import QtQuick 2.14
import QtTest 1.14

import "base"

import StatusQ.Components 0.1

WindowTestCase {
    name: "StatusExpandableItem test"
    when: windowShown

    StatusExpandableItem {
        id: expandableItem
        parent: windowContent

        primaryText: "primary text"
        secondaryText: "secondary text"
        additionalText: "additional text"

        expandable: true

        expandableComponent: Rectangle {
            width: 1000
            height: 300
        }
    }

    function initTestCase() {
        window.show()
    }

    function cleanupTestCase() {
        window.close()
    }

    function test_expand() {
        verify(!expandableItem.expanded)

        mouseClick(expandableItem, expandableItem.width / 2, expandableItem.height / 2, Qt.LeftButton)

        verify(expandableItem.expanded)
        wait(400) // transition duration
        compare(expandableItem.height, 82 + 300 + 22)
    }
}
