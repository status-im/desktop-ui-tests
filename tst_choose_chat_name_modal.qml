import QtQuick 2.14
import QtQuick.Window 2.14
import QtTest 1.14

import "base"
import "status-desktop/ui/app/AppLayouts/Onboarding/popups" as DesktopComponents


WindowTestCase {
    name: "GenKeyModal tests"

    LegacyModalsHelpers {id: legacyHelpers}


    Component {
        id: popupComponent
        DesktopComponents.GenKeyModal {
            id: genKeyModal
        }
    }


    ListModel {
        id: onBoardingModel

        ListElement {
                    username: "Three-Words-Name-1"
                    identicon: "https://cdn.impactinit.com/cdn/x/x@e7f13f160e/https://s52.impactinit.com/smsimg30//pv/ingimagecontributors/ing_47129_48199.jpg"
                    keyUid: "0x00192fb10df37c9fb26829eb2cc623cd1bf599e8"
                    address: "0x00192fb10df37c9fb26829eb2cc623cd1bf599e8"
                }

         ListElement {
                    username: "Three-Words-Name-2"
                    identicon: "https://cdn.impactinit.com/cdn/x/x@e7f13f160e/https://s52.impactinit.com/smsimg30//pv/ingimagecontributors/ing_47129_48199.jpg"
                    keyUid: "0x2efcF85B1a4Ebb49CED4AebFe08d059a6aa755B3"
                    address: "0x00192fb10df37c9fb26829eb2cc623cd1bf599e8"
                }

         ListElement {
                    username: "Three-Words-Name-3"
                    identicon: "https://cdn.impactinit.com/cdn/x/x@e7f13f160e/https://s52.impactinit.com/smsimg30//pv/ingimagecontributors/ing_47129_48199.jpg"
                    keyUid: "0x2efcF85B1a4Ebb49CED4AebFe08d059a6aa755B3"
                    address: "0x00192fb10df37c9fb26829eb2cc623cd1bf599e8"
                }

         ListElement {
                    username: "Three-Words-Name-4"
                    identicon: "https://cdn.impactinit.com/cdn/x/x@e7f13f160e/https://s52.impactinit.com/smsimg30//pv/ingimagecontributors/ing_47129_48199.jpg"
                    keyUid: "0x2efcF85B1a4Ebb49CED4AebFe08d059a6aa755B3"
                    address: "0x00192fb10df37c9fb26829eb2cc623cd1bf599e8"
                }

         ListElement {
                    username: "Three-Words-Name-5"
                    identicon: "https://cdn.impactinit.com/cdn/x/x@e7f13f160e/https://s52.impactinit.com/smsimg30//pv/ingimagecontributors/ing_47129_48199.jpg"
                    keyUid: "0x2efcF85B1a4Ebb49CED4AebFe08d059a6aa755B3"
                    address: "0x00192fb10df37c9fb26829eb2cc623cd1bf599e8"
                }

    }


    function test_case1_Gen_key_modal_height_width() {

        var genKeyModal = popupComponent.createObject(window)
        genKeyModal.open()
        wait(2000)
        compare(genKeyModal.height, 504, "height should be 504")
        compare(genKeyModal.width, 480, "width should be 480")
        genKeyModal.destroy()
    }

    function test_case2_Gen_key_modal_ui() {

        var genKeyModal = popupComponent.createObject(window)
        genKeyModal.open()
        legacyHelpers.target = genKeyModal
        var nextButton = findChild(genKeyModal, "rightArrowSubmitBtn")
        mouseClick(nextButton, nextButton.width/2, nextButton.height/2, Qt.LeftButton)
        wait(2000)

    }

}

