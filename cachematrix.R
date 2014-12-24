
##这个函数的功能是设置一个x的函数矩阵
makeCacheMatrix <- function(x = matrix()) {
        w<-NULL
        set<-function(y){
                x<<-y
                w<<-NULL
        }
        get<-function() x
        setrev<-function(rev) w<<-rev
        getrev<-function() w
        list(set=set,get=get,setrev=setrev,
        getrev=getrev)
}


## 这个函数用来判断是否存在X的缓存矩阵，如果存在则直接读取结果，如果不存在则重新计算

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        rev <- x$getrev()
        if(!is.null(rev)){
                message("getting cached data")
                return(rev)
        }
        data <- x$get()
        rev <- solve(data)
        x$setrev(rev)
        rev	
}
