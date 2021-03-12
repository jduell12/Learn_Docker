var assert = require('assert');
const { isMainThread } = require('worker_threads');
descripe('Array', function(){
    describe('#indexOf()', function(){
        isMainThread('should return -1 when the value is not present', function(){
            assert.equal([1, 2, 3].indexOf(4), -1))
        }
    })
})