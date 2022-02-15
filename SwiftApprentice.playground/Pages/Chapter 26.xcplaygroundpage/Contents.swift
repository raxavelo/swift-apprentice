//: [Previous](@previous)

import Foundation

// Chapter 26: Property Wrappers

/*
 Challenge 1: Create a generic property wrapper for CopyOnWrite
 
 Consider the property wrapper CopyOnWriteColor, which you defined earlier in this chapter.
 It lets you wrap any variable of type Color.
 It manages the sharing of an underlying storage type, Bucket, which owns a single Color instance.
 Thanks to structural sharing, multiple CopyOnWriteColor instances might share the same Bucket instance
 — thus sharing its Color instance and saving memory.
 
 To implement the copy-on-write logic, what matters about Bucket is not its domain semantics,
 like isRefilled, but just that it’s a reference type.
 You only used it as a box for Color.
 
 Since property wrappers can be generic,
 try your hand at defining a generic copy-on-write property wrapper type, CopyOnWrite.
 Instead of being able to wrap only Color values, it should be generic over any value semantic that it wraps.
 Instead of using a dedicated storage type like Bucket, it should provide its own box type to act as storage.
 
 Your challenge: Write the definition for this generic type, CopyOnWrite,
 and use it in an example to verify that the wrapped properties preserve the value semantics of the original type.
 
 To get you started, here’s a suitable definition of a box type:
 
 private class StorageBox<StoredValue> {

   var value: StoredValue
   
   init(_ value: StoredValue) {
     self.value = value
   }
 }
 */

private class StorageBox<StoredValue> {

  var value: StoredValue
  
  init(_ value: StoredValue) {
    self.value = value
  }
}

@propertyWrapper
struct CopyOnWrite<T> {
  private var storage: StorageBox<T>
  
  init(wrappedValue: T) {
    storage = StorageBox(wrappedValue)
  }
  
  var wrappedValue: T {
    get {
      return storage.value
    }
    
    set {
      if isKnownUniquelyReferenced(&storage) {
        storage.value = newValue
      } else {
        storage = StorageBox(newValue)
      }
    }
  }
}


/*
 Challenge 2: Implement @ValueSemantic
 
 Using StorageBox from the previous challenge and the following protocol,
 DeepCopyable, as a constraint, write the definition for a generic property wrapper @ValueSemantic.
 Then use it in an example to verify that wrapped properties have value semantics
 even when wrapping an underlying type that doesn’t.
 Example: NSMutableString is an example of a non-value semantic type.
 Make it conform to DeepCopyable and test it with @ValueSemantic.
 
 Hints:
  - If the DeepCopyable conforming type is a reference type or otherwise doesn’t have value semantics,
    making a deep copy ensures properties don’t share any storage and changes to one don’t affect the other.
  - Note that if the conforming type already has value semantics,
    it meets these requirements, so it’s enough to return self.
    In this case, however, there’s no point in using @ValueSemantic.

 protocol DeepCopyable {

   /* Returns a deep copy of the current instance.

      If `x` is a deep copy of `y`, then:
         - The instance `x` should have the same value as `y`
           (for some sensible definition of value – not just
           memory location or pointer equality!)
         - It should be impossible to do any operation on `x`
           that will modify the value of the instance `y`.

     Note: A value semantic type implementing this protocol can just
           return `self` since that fulfills the above requirement.
   */

   func deepCopy() -> Self
 }
 */

protocol DeepCopyable {

  /* Returns a deep copy of the current instance.

     If `x` is a deep copy of `y`, then:
        - The instance `x` should have the same value as `y`
          (for some sensible definition of value – not just
          memory location or pointer equality!)
        - It should be impossible to do any operation on `x`
          that will modify the value of the instance `y`.

    Note: A value semantic type implementing this protocol can just
          return `self` since that fulfills the above requirement.
  */

  func deepCopy() -> Self
}

@propertyWrapper
struct ValueSemantic<T: DeepCopyable> {
  private var storage: StorageBox<T>
  
  init(wrappedValue: T) {
    storage = StorageBox(wrappedValue.deepCopy())
  }
  
  var wrappedValue: T {
    mutating get {
      if isKnownUniquelyReferenced(&storage) {
        return storage.value
      } else {
        storage = StorageBox(storage.value.deepCopy())
        return storage.value
      }
    }
    
    set {
      if isKnownUniquelyReferenced(&storage) {
        storage.value = newValue
      } else {
        storage = StorageBox(newValue.deepCopy())
      }
    }
  }
}

//: [Next](@next)
