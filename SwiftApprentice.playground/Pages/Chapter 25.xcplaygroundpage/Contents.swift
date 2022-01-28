//: [Previous](@previous)

import Foundation

// Chapter 25: Value Types & Reference Types

/*
 Challenge 1: Image with value semantics
 
 Build a new type, Image, that represents a simple image.
 It should also provide mutating functions that apply modifications to the image.
 Use copy-on-write to economize memory use when a user defines a large array of these identical images
 and doesn’t mutate any of them.
 
 To get started, assume you’re using the following Pixels class for the raw storage:
 
 private class Pixels {
   let storageBuffer: UnsafeMutableBufferPointer<UInt8>

   init(size: Int, value: UInt8) {
     let p = UnsafeMutablePointer<UInt8>.allocate(capacity: size)
     storageBuffer = UnsafeMutableBufferPointer<UInt8>(start: p, count: size)
     storageBuffer.initialize(from: repeatElement(value, count: size))
   }

   init(pixels: Pixels) {
     let otherStorage = pixels.storageBuffer
     let p  = UnsafeMutablePointer<UInt8>.allocate(capacity: otherStorage.count)
     storageBuffer = UnsafeMutableBufferPointer<UInt8>(start: p, count: otherStorage.count)
     storageBuffer.initialize(from: otherStorage)
   }
   
   subscript(offset: Int) -> UInt8 {
     get {
       storageBuffer[offset]
     }
     set {
       storageBuffer[offset] = newValue
     }
   }
   
   deinit {
     storageBuffer.baseAddress!.deallocate(capacity: self.storageBuffer.count)
   }
 }

 Your image should be able to set and get individual pixel values and set all values at once.
 Typical usage:
 
 var image1 = Image(width: 4, height: 4, value: 0)

 // test setting and getting
 image1[0,0] // -> 0
 image1[0,0] = 100
 image1[0,0] // -> 100
 image1[1,1] // -> 0

 // copy
 var image2 = image1
 image2[0,0] // -> 100
 image1[0,0] = 2
 image1[0,0] // -> 2
 image2[0,0] // -> 100 because of copy-on-write

 var image3 = image2
 image3.clear(with: 255)
 image3[0,0] // -> 255
 image2[0,0] // -> 100 thanks again, copy-on-write
 */

private class Pixels {
  let storageBuffer: UnsafeMutableBufferPointer<UInt8>

  init(size: Int, value: UInt8) {
    let p = UnsafeMutablePointer<UInt8>.allocate(capacity: size)
    storageBuffer = UnsafeMutableBufferPointer<UInt8>(start: p, count: size)
    storageBuffer.initialize(from: repeatElement(value, count: size))
  }

  init(pixels: Pixels) {
    let otherStorage = pixels.storageBuffer
    let p  = UnsafeMutablePointer<UInt8>.allocate(capacity: otherStorage.count)
    storageBuffer = UnsafeMutableBufferPointer<UInt8>(start: p, count: otherStorage.count)
    storageBuffer.initialize(from: otherStorage)
  }
  
  subscript(offset: Int) -> UInt8 {
    get {
      storageBuffer[offset]
    }
    set {
      storageBuffer[offset] = newValue
    }
  }
  
  deinit {
    storageBuffer.baseAddress!.deallocate()
  }
}

struct Image {
  private var width: Int
  private var height: Int
  private var pixels: Pixels
  
  init(width: Int, height: Int, value: UInt8) {
    self.width = width
    self.height = width
    self.pixels = Pixels(size: width * height, value: value)
  }
  
  subscript(x: Int, y: Int) -> UInt8 {
    get {
      pixels[y * height + x]
    }
    set {
      if isKnownUniquelyReferenced(&pixels) {
        pixels[y * height + x] = newValue
      } else {
        pixels = Pixels(pixels: pixels)
        pixels[y * height + x] = newValue
      }
    }
  }
  
  mutating func clear(with value: UInt8) {
    pixels = Pixels(size: width * height, value: value)
  }
}

var image1 = Image(width: 4, height: 4, value: 0)

// test setting and getting
image1[0,0] // -> 0
image1[0,0] = 100
image1[0,0] // -> 100
image1[1,1] // -> 0

// copy
var image2 = image1
image2[0,0] // -> 100
image1[0,0] = 2
image1[0,0] // -> 2
image2[0,0] // -> 100 because of copy-on-write

var image3 = image2
image3.clear(with: 255)
image3[0,0] // -> 255
image2[0,0] // -> 100 thanks again, copy-on-write

//: [Next](@next)
