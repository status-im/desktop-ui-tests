import QtQuick 2.14
import QtTest 1.14

import QtQuick.Window 2.14

TestCase {
    id: root

    readonly property Window window: baseWindow

    Window {
        id: baseWindow
        width: 800
        height: 600
    }
}
