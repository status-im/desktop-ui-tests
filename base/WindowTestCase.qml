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

    property Helpers __helpers: Helpers {}

    function getObjectByObjectName(parent, objectName) {
        var result = __helpers.getObjectByObjectName(parent, objectName)
        verify(result, "Method getObjectByObjectName can't find object with name:" + objectName + " in parent:" + parent.toString())
        return result
    }

    function clickOnButton(item) {
        verify(item, "item is null")
        verify((item.width !== 0 && item.height !== 0) ||
               (item.implicitWidth !== 0 && item.implicitHeight !== 0) , "item has zero sizes")
        verify(item.visible, "item is invisibble")

        if (item.width !== 0 && item.height !== 0) {
            mouseClick(item, item.width / 2, item.height / 2, Qt.LeftButton)
        } else {
            mouseClick(item, item.implicitWidth / 2, item.implicitHeight / 2, Qt.LeftButton)
        }
    }

    function initTestCase() {
        window.show()
    }

    function cleanupTestCase() {
        window.close()
    }
}
