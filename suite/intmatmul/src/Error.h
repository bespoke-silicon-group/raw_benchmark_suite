/*
 * $Header: /projects/raw/cvsroot/benchmark/suites/intmatmul/src/Error.h,v 1.2 1997/08/09 05:57:25 jbabb Exp $
 *
 * Error.h
 *
 * Authors: Michael B. Taylor       (mtaylor@lcs.mit.edu)
 *
 * Copyright @ 1997 MIT Laboratory for Computer Science, Cambridge, MA 02129
 */

#define verify(x,y) do { if (x) ;                        \
                        else                             \
				{	 fprintf(stderr,"[%s] [source %s : %d]\n", \
						    y,                     \
						    __FILE__,              \
						    __LINE__); exit(-1);}  } while (0)

#define verify2(x,y,z) do { if (x) ;                        \
                        else                             \
				{	 fprintf(stderr,"[%s %s] [source %s : %d]\n", \
						    y,z,                     \
						    __FILE__,              \
						    __LINE__); exit(-1);}  } while (0)
