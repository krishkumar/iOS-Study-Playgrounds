/*:
 [⬅ Operation](@previous)
 
 ## [NS]OperationQueue
 
 There's not a lot of point of carefully wrapping up complex functionality in `Operation` objects if you then have to call `start()` on each of them to actually begin execution.
 
 Enter `OperationQueue`, which manages the execution of one or more `Operation` objects. Rather than having to handle threads directly, you instead pass your operations to a queue to be executed at the system's discretion. A queue can be configured to allow concurrent execution of the operations in the queue.
 
 */

import UIKit


//: Using the same tilt-shift operation, this time you've got a set of images rather than just one:
let imageNames = ["dark_road_small", "train_day", "train_dusk", "train_night"]

let images = imageNames.flatMap { UIImage(named: "\($0).jpg") }
images


class TiltShiftOperation: Operation {
  var inputImage: UIImage?
  var outputImage: UIImage?
  
  override func main() {
    outputImage = tiltShift(image: inputImage)
  }
}


//: Creating a queue is simple - using the default constructor:
let queue = OperationQueue()

var operations = [TiltShiftOperation]()


/*:
 Use the `addOperation()` method on `NSOperationQueue` to add each operation to the queue.
 
 - important:
 Adding operations to a queue is really "cheap"; although the operations can start executing as soon as they arrive on the queue, adding them is completely asynchronous.
 \
You can see that here, with the result of the `duration` function:
 
 */

duration {
  for image in images {
    let op = TiltShiftOperation()
    op.inputImage = image
    operations += [op]
    
    queue.addOperation(op)
  }
}


/*:
 * experiment:
 You can control the maximum number of operations that a queue can execute simultaneously with the `maxConcurrentOperationCount` property. Setting this to `1` makes the queue a *serial* queue.
 \
 \
Try changing the value of this property below to see how it affects the time it takes for the queue to finish processing all operations.
 \
_You'll find that this doesn't actually work—you need to set this property __before__ you add the operations to the queue._
 */

queue.maxConcurrentOperationCount = 1

duration {
  queue.waitUntilAllOperationsAreFinished()
}



//: Check that all operations have filtered the image as expected
let output = operations.flatMap { $0.outputImage }
output[0]
output[1]
output[2]
output[3]

//: [➡ Operation Async](@next)
