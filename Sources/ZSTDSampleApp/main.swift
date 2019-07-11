import Foundation
import SwiftZSTD

var processor = ZSTDProcessor(useContext: true)


// Test compressing and decompressing
let original = sampleJson.data(using: .utf8)!

print("Testing compression\n")
print("Original size: \(original.count) bytes")
let compressed = try processor.compressBuffer(original, compressionLevel: 9)
print("Compressed size: \(compressed.count) bytes")
let decompressed = try processor.decompressFrame(compressed)
if (decompressed == original) {
    print("Decompressed string is the same as original.")
} else {
    print("Decompressed string is different from original.. :(")
}

print("\nTesting compression with dictionary\n")
print("Building Dictionary")
let dictionary = try! buildDictionary(fromSamples: trainingJson.map { $0.data(using: .utf8)! })

let dictionaryProcessor = DictionaryZSTDProcessor(withDictionary: dictionary, andCompressionLevel: 9)!
print("Original size: \(original.count) bytes")
let dictionaryCompressed = try dictionaryProcessor.compressBufferUsingDict(original)
print("Compressed size: \(dictionaryCompressed.count) bytes")
let dictionaryDecompressed = try dictionaryProcessor.decompressFrameUsingDict(dictionaryCompressed)
if (dictionaryDecompressed == original) {
    print("Dictionary decompressed string is the same as original.")
} else {
    print("Dictionary decompressed string is different from original.. :(")
}