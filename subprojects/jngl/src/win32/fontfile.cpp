// Copyright 2019-2021 Jan Niklas Hasse <jhasse@bixense.com>
// For conditions of distribution and use, see copyright notice in LICENSE.txt

#include "../window.hpp"

#include "unicode.hpp"

#include <algorithm>
#include <shlobj.h>
#include <sstream>

namespace jngl {

std::string Window::GetFontFileByName(const std::string& fontName) {
#ifdef JNGL_UWP
	return "Arial.ttf"; // TODO: Does UWP include any fonts?
#else
	static std::unordered_map<std::string, std::string> cache;
	const auto it = cache.find(fontName);
	if (it != cache.end()) {
		return it->second;
	}
	std::string fontNameLower = fontName;
	std::transform(fontNameLower.begin(), fontNameLower.end(), fontNameLower.begin(), ::tolower);
	if (fontNameLower == "serif") {
		fontNameLower = "times";
	} else if (fontNameLower == "mono" || fontNameLower == "monospace") {
		fontNameLower = "cour";
	} else if (fontNameLower == "sans" || fontNameLower == "sans-serif") {
		fontNameLower = "arial";
	}
	HKEY hKey;
	if (RegOpenKeyEx(HKEY_LOCAL_MACHINE, L"Software\\Microsoft\\Windows NT\\CurrentVersion\\Fonts",
	                 0, KEY_READ, &hKey) != ERROR_SUCCESS) {
		throw std::runtime_error("Couldn't open registry.");
	}

	DWORD maxValueNameSize, maxValueDataSize;
	if (RegQueryInfoKey(hKey, 0, 0, 0, 0, 0, 0, 0, &maxValueNameSize, &maxValueDataSize, 0, 0) !=
	    ERROR_SUCCESS) {
		throw std::runtime_error("Couldn't query registry.");
	}

	DWORD valueIndex = 0;
	const auto valueName = std::make_unique<wchar_t[]>(maxValueNameSize);
	const auto valueData = std::make_unique<BYTE[]>(maxValueDataSize);
	std::string fontFile;
	LONG result;
	do {
		DWORD valueDataSize = maxValueDataSize;
		DWORD valueNameSize = maxValueNameSize;
		DWORD valueType;
		result = RegEnumValue(hKey, valueIndex, valueName.get(), &valueNameSize, 0, &valueType,
		                      valueData.get(), &valueDataSize);

		valueIndex++;

		if (result != ERROR_SUCCESS || valueType != REG_SZ) {
			continue;
		}

		std::string valueNameLower = utf16ToUtf8({ valueName.get(), valueNameSize });
		std::transform(valueNameLower.begin(), valueNameLower.end(), valueNameLower.begin(),
		               ::tolower);
		if (fontNameLower + " (truetype)" == valueNameLower) {
			fontFile =
			    utf16ToUtf8({ reinterpret_cast<wchar_t*>(valueData.get()), valueDataSize / 2 });
			break;
		}
		if ((fontNameLower == "arial" && valueNameLower == "liberation sans (truetype)") ||
		    (fontNameLower == "courier new" && valueNameLower == "liberation mono (truetype)") ||
		    (fontNameLower == "times new roman" &&
		     valueNameLower == "liberation serif (truetype)")) {
			// Fallbacks for WINE. No break, so that exact matches take priority
			fontFile =
			    utf16ToUtf8({ reinterpret_cast<wchar_t*>(valueData.get()), valueDataSize / 2 });
		}
	} while (result != ERROR_NO_MORE_ITEMS);

	RegCloseKey(hKey);
	if (fontFile.size() < 2 || fontFile[1] != ':') { // relative path?
		wchar_t fontDir[MAX_PATH];
		if (SHGetFolderPath(NULL, CSIDL_FONTS, NULL, 0, fontDir) != S_OK) {
			throw std::runtime_error("Couldn't locate font directory.");
		}
		std::ostringstream ss;
		ss << utf16ToUtf8(fontDir) << "\\";
		if (fontFile.empty()) {
			ss << fontName << ".ttf";
		} else {
			ss << fontFile;
		}
		fontFile = ss.str();
	}
	cache.emplace(fontName, fontFile);
	return fontFile;
#endif
}

} // namespace jngl
