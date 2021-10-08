import QtQuick 2.14

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

    property var ens: ({preferredUserName: "preffered User name"})
}
