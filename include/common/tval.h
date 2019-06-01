/*
 * $Header: /projects/raw/cvsroot/benchmark/include/common/tval.h,v 1.2 1997/08/09 05:56:17 jbabb Exp $
 *
 * RAW Benchmark Suite common library header for timer routines
 *
 * Authors: Matthew Frank           (mfrank@lcs.mit.edu)
 *
 * Copyright @ 1997 MIT Laboratory for Computer Science, Cambridge, MA 02129
 */

#ifndef TVAL_H
#define TVAL_H

/* length of time to run each test in seconds */
#define TIMELIMIT 30.0 * 1000000.0

typedef long tval_t;

/* Just a call to clock() for now.  We might do something fancier in
 * the future.
 */
#define get_time(a) ((a) = clock())

/* return time difference in seconds */
static inline float diff_time(tval_t end, tval_t start) {
  return ((float)(end-start) / 1000000.0);
}

#endif TVAL_H
