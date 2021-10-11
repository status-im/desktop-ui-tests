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
            return "0x044e25ab58dcb5a997288dce919a81b00a1c95513cbc17f3d9098c8fd69b863dd687e88ef190ab031ea89130982f312554ac2e13d42a0332ffc6fd7632111fafaf"
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
            property string pubKey: "0x044e25ab58dcb5a997288dce919a81b00a1c95513cbc17f3d9098c8fd69b863dd687e88ef190ab031ea89130982f312554ac2e13d42a0332ffc6fd7632111fafaf"
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
            id: profilePopup
        }
    }
    ///////

    function initTestCase() {
        window.show()
    }

    function cleanupTestCase() {

    }

    function test_case1() {
        // opens your own profile
        profilePopup.openPopup(true,"Forceful Slateblue Purplemarten", "0x044e25ab58dcb5...2ffc6fd7632111fafaf")
        wait(2000) // for show how its works
        // checks that QR code button is present
        //verify(helpers.checkIfItemExists(profilePopup.background, profilePopup.width - 60, 20, "StatusFlatRoundButton"))
        // clicks QR code button
        mouseClick(profilePopup.background, profilePopup.width - 60, 20, Qt.LeftButton)
        //wait(2000) // for show how its works
        verify(profilePopup.contentItem.qrCodePopup.visible, "Qr code should be visible")
        profilePopup.contentItem.qrCodePopup.close()
        verify(!profilePopup.contentItem.qrCodePopup.visible, "Qr code should be visible")
    }

    function test_case2() {
        mouseClick(profilePopup.background, profilePopup.width - 25, 20, Qt.LeftButton)
        wait(2000)
        verify(profilePopup.visible, "Profile popup should be invisible")
    }
}

