import QtQuick 2.14
import QtQuick.Window 2.14
import QtTest 1.14

import "base"
import "status-desktop/ui/app/AppLayouts/Chat/components" as DesktopComponents


TestCase {
    name: "ProfilePopup"
    when: windowShown

    Helpers { id: helpers }

    /// TODO: add good test data
    QtObject {
        id: chatsModel
        property var ensView: QtObject {
            function isEnsVerified(author) {
                return true;
            }
        }

        function alias(author) {
            return "some alias"
        }
    }

    QtObject {
        id: profileModel
        property var contacts: QtObject {
            function isContactBlocked(author) {
                return false;
            }

            function isAdded(author) {
                return true
            }
        }

        property var profile: QtObject {
            property string pubKey: "Some author"
        }

        function qrCode(author) {
            return ""
        }
    }

    Window {
        id: window
        width: 800
        height: 600
        DesktopComponents.ProfilePopup {
            id: propfilePopup
        }
    }
    ///////

    function initTestCase() {
        window.show()
    }

    function cleanupTestCase() {

    }

    function test_case1() {
        propfilePopup.openPopup(true, "Test user", "Some author", "", "bla bla test it bitch", "Nickname")
        wait(2000) // for show how its works
        mouseClick(propfilePopup.background, propfilePopup.width - 65, 20, Qt.LeftButton)
        verify(helpers.checkIfItemExists(propfilePopup.background, propfilePopup.width - 65, 20, "StatusFlatRoundButton"))
        wait(2000) // for show how its works
        verify(propfilePopup.contentItem.qrCodePopup.visible, "Qr code should be visible")
        propfilePopup.contentItem.qrCodePopup.close()
        verify(!propfilePopup.contentItem.qrCodePopup.visible, "Qr code should be visible")
    }

    function test_case2() {
        mouseClick(propfilePopup.background, propfilePopup.width - 25, 20, Qt.LeftButton)
        wait(2000)
        verify(!propfilePopup.visible, "Profile popup should be invisible")
    }
}

