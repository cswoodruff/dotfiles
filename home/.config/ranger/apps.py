# Copyright (C) 2009, 2010  Roman Zimbelmann <romanz@lavabit.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

"""
This is the default ranger configuration file for filetype detection
and application handling.

You can place this file in your ~/.config/ranger/ directory and it will be used
instead of this one.  Though, to minimize your effort when upgrading ranger,
you may want to subclass CustomApplications rather than making a full copy.
            
This example modifies the behaviour of "feh" and adds a custom media player:

#### start of the ~/.config/ranger/apps.py example
	from ranger.defaults.apps import CustomApplications as DefaultApps
	from ranger.api.apps import *
			
	class CustomApplications(DefaultApps):
		def app_kaffeine(self, c):
			return tup('kaffeine', *c)

		def app_feh_fullscreen_by_default(self, c):
			return tup('feh', '-F', *c)

		def app_default(self, c):
			f = c.file #shortcut
			if f.video or f.audio:
				return self.app_kaffeine(c)

			if f.image and c.mode == 0:
				return self.app_feh_fullscreen_by_default(c)

			return DefaultApps.app_default(self, c)
#### end of the example
"""

from ranger.defaults.apps import CustomApplications as DefaultApps
from ranger.api.apps import *
class CustomApplications(DefaultApps):
	def app_default(self, c):
		"""How to determine the default application?"""
		f = c.file

		if f.basename.lower() == 'makefile':
			return self.either(c, 'make')

		if f.extension is not None:
			if f.extension in ('pdf', ):
				c.flags += 'd'
				return self.either(c, 'evince', 'zathura', 'apvlv', 'epdfview')
			if f.extension in ('xml', ):
				return self.either(c, 'editor')
			if f.extension in ('html', 'htm', 'xhtml'):
				return self.either(c, 'firefox', 'opera', 'jumanji',
						'luakit', 'elinks', 'lynx')
			if f.extension == 'swf':
				return self.either(c, 'firefox', 'opera', 'jumanji', 'luakit')
			if f.extension == 'nes':
				return self.either(c, 'fceux')
			if f.extension in ('swc', 'smc'):
				return self.either(c, 'zsnes')
			if f.extension in ('odt', 'ods', 'odp', 'odf', 'odg',
					'doc', 'xls'):
				return self.either(c, 'libreoffice', 'soffice', 'ooffice')

		if f.container:
			return self.either(c, 'aunpack', 'file_roller')

		if f.video or f.audio:
			if f.video:
				c.flags += 'd'
			return self.either(c, 'mplayer', 'smplayer', 'vlc', 'totem')

		if f.image:
			return self.either(c, 'feh', 'eog', 'mirage')

		if f.document or f.filetype.startswith('text') or f.size == 0:
			return self.either(c, 'editor')

		return DefaultApps.app_default(self, c)

# Often a programs invocation is trivial.  For example:
#    vim test.py readme.txt [...]
# This could be implemented like:
#    @depends_on("vim")
#    def app_vim(self, c):
#        return tup("vim", *c.files)
# Instead of creating such a generic function for each program, just add
# its name here and it will be automatically done for you.
CustomApplications.generic('vim', 'fceux', 'elinks', 'wine',
		'zsnes', 'javac')

# By setting flags='d', this programs will not block ranger's terminal:
CustomApplications.generic('opera', 'firefox', 'apvlv', 'evince',
		'zathura', 'gimp', 'mirage', 'eog', 'epdfview', flags='d')
