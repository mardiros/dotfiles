#!/usr/bin/env python3
"""

This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <http://unlicense.org>

"""

import argparse
import difflib
import os
import os.path
import shutil
import sys
import time

sep = os.path.sep
curfile = os.path.abspath(__file__)
here = os.path.dirname(curfile) + sep
dest = os.path.expanduser('~') + sep + '.'


def identical(src, target):
    ident = True
    sdiff = ''
    with open(src) as fsrc:
        with open(target) as ftarget:
            diff = difflib.ndiff(ftarget.readlines(), fsrc.readlines())

            diff_header = True
            for idx, line in enumerate(diff):
                if line.startswith(' '):
                    diff_header = True
                    continue
                if diff_header:
                   diff_header = False
                   if ident:
                       ident = False
                   sdiff += '{} +{}\n'.format(target, idx)
                sdiff += line
    if not ident:
        sdiff += '\n'
    return ident, sdiff

def main(dry_run, verbose):

    for root, dirs, files in os.walk(here):
         root = root.rstrip(sep) + sep
         prefix = root.replace(here, dest)

         for src in dirs:
             if (root + src).startswith(here + '.'):
                 if verbose:
                     print('Ignoring hidden directory {}'.format(root + src))
                 continue

             target = prefix + src
             if os.path.exists(target):
                 if os.path.isdir(target):
                     if verbose:
                         print('Ignoring existing directory {}'.format(target))
                     continue

                 print('Remove file {}, replaced by a src'.format(target))
                 if not dry_run:
                     os.remove(target)

             print('Creating new src {}'.format(target))
             if not dry_run:
                 os.mkdir(target, mode=0o700)

         for src in files:
             if src.startswith('.') or \
                     (root + src).startswith(here + '.') or \
                     root + src == curfile or \
                     root + src == here + 'LICENSE' or \
                     root + src == here + 'README.md':
                 if verbose:
                     print('Ignored file {}'.format(root + src))
                 continue
             target = sep.join([prefix + src])
             src = root + src
             if os.path.exists(target):
                 if verbose:
                     print('Comparing files {} {}'.format(src, target))
                 try:
                     ident, diff = identical(src, target)
                 except UnicodeDecodeError:
                     diff = '[binary files]'
                     src_time = time.ctime(os.path.getmtime(src))
                     target_time = time.ctime(os.path.getmtime(target))
                     ident = src_time == target_time
                 if ident:
                     if verbose:
                         print('Ignoring identical file {}'.format(target))
                 else:
                     print('Replacing {} by {}'.format(target, src))
                     if verbose or dry_run:
                         print(diff)
             else:
                 print('Copying {} to {}'.format(src, target))
             if not dry_run:
                 shutil.copy2(src, target)


if __name__ == '__main__':

    parser = argparse.ArgumentParser()
    parser.add_argument('-v', '--verbose',
                        dest='verbose',
                        action='store_const',
                        const=True,
                        default=False)

    parser.add_argument('-d', '--dry-run',
                        dest='dry_run',
                        action='store_const',
                        const=True,
                        default=False)

    kwargs = vars(parser.parse_args(sys.argv[1:]))
    main(**kwargs)

