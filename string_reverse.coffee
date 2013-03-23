String::reverse = -> 
   return this if this.length < 2
   return this[1..].reverse() + this[0]

console.log "Hello".reverse()