#!/usr/bin/env python
#-*- coding: utf-8 -*-
import os
from fabric.api import *

config = {
    'cmp': 'ariftek',
    'prj': 'kitchen',
    'ver': 1
}

BUCKET = '{cmp}-{prj}-{ver}'.format(**config)
ROOT = os.path.dirname(os.path.abspath(__file__))
STATIC = os.path.expanduser(os.path.join('~', 'clouds', 'amazon', BUCKET))

def coffee(fname):
    """compile coffeescript"""
    local(' '.join((
        'coffee',
        '--compile',
        '--output',
        os.path.join(STATIC, os.path.dirname(fname)),
        fname
    )))

def jade(fname):
    """compile jade"""
    local(' '.join((
        'jade',
        '--pretty',
        '--out',
        os.path.join(STATIC, os.path.dirname(fname)),
        fname
    )))

def svg(fname):
    """copy svg"""
    local(' '.join((
        'cp',
        fname,
        os.path.join(STATIC, os.path.dirname(fname))
    )))


def stylus(fname):
    """compile stylus"""
    local(' '.join((
        'stylus',
        '--out',
        os.path.join(STATIC, os.path.dirname(fname)),
        fname
    )))

CMD_MAP = {
    '.coffee': (coffee, '.js'),
    '.jade': (jade, '.html'),
    '.styl': (stylus, '.css'),
    '.svg': (svg, '.svg'),
}

def build(force=False):
    """build static site"""
    for root, dirs, files in os.walk('.'):
        files = [f for f in files if not f.startswith('.')]
        dirs[:] = [d for d in dirs if not d.startswith('.')]
        for f in files:
            if f == 'vars.jade': continue
            src = f if root == '.' else os.path.join(root[2:], f)
            fname, ext = os.path.splitext(src)
            if not CMD_MAP.has_key(ext): continue
            cmd, ext2 = CMD_MAP[ext]
            dst = os.path.join(STATIC, fname+ext2)
            if (
                not os.path.exists(dst)
                or os.stat(src).st_mtime >= os.stat(dst).st_mtime
                or force
            ):
                cmd(src)

def sync():
    local(' '.join((
        's3cmd',
        'sync',
        STATIC,
        's3://{0}'.format(BUCKET)
    )))
