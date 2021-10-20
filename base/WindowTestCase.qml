import QtQuick 2.14
import QtTest 1.14

import QtQuick.Window 2.14

TestCase {
    id: root

    readonly property Window window: baseWindow
    readonly property Item windowContent: contentWindow

    Window {
        id: baseWindow
        width: 800
        height: 600

        Item {
            id: contentWindow
            anchors.fill: parent
        }

        visible: true
    }

    function initTestCase() {
        window.show()
    }

    function cleanupTestCase() {
        window.close()
    }
}
