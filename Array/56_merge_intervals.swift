/**
 * Definition for an interval.
 * public class Interval {
 *   public var start: Int
 *   public var end: Int
 *   public init(_ start: Int, _ end: Int) {
 *     self.start = start
 *     self.end = end
 *   }
 * }
 */
class Solution {
    func merge(_ intervals: [Interval]) -> [Interval] {

        var ret = [Interval]()
       
        // sort by object property. 
        let sorted = intervals.sorted(by: { $0.start <= $1.start })
        for interval in sorted {
            
            if ret.count == 0 || ret.last!.end < interval.start {
                ret.append(interval)
            } else {
                ret.last!.end = max(ret.last!.end, interval.end)
            }
        }
        return ret
    }
}
