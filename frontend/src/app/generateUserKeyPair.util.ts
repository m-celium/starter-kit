export async function generateUserKeyPairUtil() {
    return window.crypto.subtle.generateKey({
        name: "RSA-OAEP",
        modulusLength: 2048,
        publicExponent: new Uint8Array([0x01, 0x00, 0x01]),
        hash: "SHA-256",
    }, true, ['decrypt','encrypt']);
}

generateUserKeyPairUtil()
