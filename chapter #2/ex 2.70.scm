

(define lyrics (generate-huffman-tree 
                '((a 2) (get 2) (sha 3) (wah 1) (boom 1) (job 2) (na 16) (yip 9))))

(encode-symbols '(get a job
					sha na na na na na na na na
					get a job
					sha na na na na na na na na
					wah yip yip yip yip yip yip yip yip yip
					sha boom)
                lyrics)
                
; the number of words in the song is 36 and we have a dictonary of 8 words which nees log 8 = 3 -----> 3*36 =108 bits ,so the huffman safes about 20% of space

