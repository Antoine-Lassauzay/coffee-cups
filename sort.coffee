Array::shuffle = ->
    copy = this.concat()
    final = []
    while copy.length > 0
        rand_index = Math.floor( Math.random() * copy.length )
        final.push( copy.splice(rand_index, 1)[0] )
    
    return final
    
num_compare = (a, b) -> 
    parseInt(a) - parseInt(b)
    
test_array = [0..10].shuffle()

console.log( test_array.concat().sort(num_compare) )

Array::bubble_sort = (cmp) ->
    swapped = true
    while swapped
        swapped = false
        i = 1
        while i < this.length
            if cmp(this[i-1], this[i]) > 0
                tmp = this[i-1]
                this[i-1] = this[i]
                this[i] = tmp
                swapped = true
            i++
    return this
                
console.log( test_array.concat().bubble_sort(num_compare) )

Array::merge_sort = (cmp) ->
                
    return this if this.length <= 1

    middle = Math.floor(this.length / 2)
    left = this[0..middle-1]
    right = this[middle..]
            
    left = left.merge_sort(cmp)
    right = right.merge_sort(cmp)

    res = []
    while left.length > 0 or right.length > 0
        if left.length > 0 and right.length > 0
            if cmp(left[0], right[0]) <= 0
                res.push(left.shift())
            else
                res.push(right.shift())
        else
            if left.length > 0
                res.push(left.shift())
            else
                res.push(right.shift()) 
                    
    return res
    
console.log( test_array.merge_sort(num_compare) )

        
            
    