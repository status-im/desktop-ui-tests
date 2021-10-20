import QtQuick 2.14
import QtTest 1.14

import "base"

import StatusQ.Components 0.1

import StatusQ.Popups 0.1

WindowTestCase {
    name: "ChatInfoToolbar test"


    SignalSpy {
        id: clickedSpy
        target: infoToolBar
        signalName: "chatInfoButtonClicked"
    }

    SignalSpy {
        id: addClicked
        target: infoToolBar
        signalName: "addButtonClicked"
    }

    StatusChatInfoToolBar {
        id: infoToolBar
        parent: windowContent
        anchors.centerIn: parent

        chatInfoButton.title: "CryptoKitties"
        chatInfoButton.subTitle: "128 Members"
        chatInfoButton.image.source: "https://pbs.twimg.com/profile_images/1369221718338895873/T_5fny6o_400x400.jpg"
        popupMenu: StatusPopupMenu {

            StatusMenuItem {
                text: "Create channel"
                icon.name: "channel"
            }

            StatusMenuItem {
                text: "Create category"
                icon.name: "channel-category"
            }

            StatusMenuSeparator {}

            StatusMenuItem {
                text: "Invite people"
                icon.name: "share-ios"
            }

        }
    }

    function test_clickFunctions() {
        // Verify than signal exists
        verify(clickedSpy.valid, "Signal " + clickedSpy.signalName + "is not valid")
        verify(addClicked.valid, "Signal " + addClicked.signalName + "is not valid")

        // Verify than button clicked
        compare(clickedSpy.count, 0)
        mouseClick(infoToolBar, 10, 10, Qt.LeftButton)
        compare(clickedSpy.count, 1)

        // Verify than add button clicked
        compare(addClicked.count, 0)
        mouseClick(infoToolBar, infoToolBar.implicitWidth  - 10, infoToolBar.implicitHeight / 2)
        compare(addClicked.count, 1)
    }
}
