##
## Redistribution and use in source and binary forms, with or without
## modification, are permitted provided that the following conditions
## are met:
##  * Redistributions of source code must retain the above copyright
##    notice, this list of conditions and the following disclaimer.
##  * Redistributions in binary form must reproduce the above copyright
##    notice, this list of conditions and the following disclaimer in the
##    documentation and/or other materials provided with the distribution.
##  * Neither the name of NVIDIA CORPORATION nor the names of its
##    contributors may be used to endorse or promote products derived
##    from this software without specific prior written permission.
##
## THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS ''AS IS'' AND ANY
## EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
## IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
## PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
## CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
## EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
## PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
## PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
## OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
## (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
## OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
##
## Copyright (c) 2008-2021 NVIDIA Corporation. All rights reserved.

#
# Build SampleRenderer
#

IF(NOT DIRECTX_INCLUDE_DIRS)
	IF($ENV{PM_DirectXSDK_VERSION})
		find_package(DirectXSDK $ENV{PM_DirectXSDK_VERSION} CONFIG REQUIRED)
	ELSE()
		IF(EXISTS $ENV{DXSDK_DIR})
			SET(DIRECTX_INCLUDE_DIRS $ENV{DXSDK_DIR}/Include)
		ELSE()
			MESSAGE("For samples compilation please install DXSDK.")
		ENDIF()
	ENDIF()
	SET(DIRECTX_INCLUDE_DIRS ${DIRECTX_INCLUDE_DIRS} CACHE INTERNAL "DirectX SDK include path")
ENDIF()


SET(SAMPLERENDERER_COMPILE_DEFS
	# Common to all configurations

	${PHYSX_WINDOWS_COMPILE_DEFS};${SAMPLES_WINDOWS_COMPILE_DEFS};

	$<$<CONFIG:debug>:${PHYSX_WINDOWS_DEBUG_COMPILE_DEFS};>
	$<$<CONFIG:checked>:${PHYSX_WINDOWS_CHECKED_COMPILE_DEFS};>
	$<$<CONFIG:profile>:${PHYSX_WINDOWS_PROFILE_COMPILE_DEFS};>
	$<$<CONFIG:release>:${PHYSX_WINDOWS_RELEASE_COMPILE_DEFS};>
)

SET(SAMPLE_NULLRENDERER_DIR ${PHYSX_ROOT_DIR}/samples/sampleframework/renderer/src/null)
SET(SAMPLERENDERER_NULLRENDERER_SOURCES
	${SAMPLE_NULLRENDERER_DIR}/NULLRenderer.cpp
	${SAMPLE_NULLRENDERER_DIR}/NULLRenderer.h
	${SAMPLE_NULLRENDERER_DIR}/NULLRendererDirectionalLight.cpp
	${SAMPLE_NULLRENDERER_DIR}/NULLRendererDirectionalLight.h
	${SAMPLE_NULLRENDERER_DIR}/NULLRendererIndexBuffer.cpp
	${SAMPLE_NULLRENDERER_DIR}/NULLRendererIndexBuffer.h
	${SAMPLE_NULLRENDERER_DIR}/NULLRendererInstanceBuffer.cpp
	${SAMPLE_NULLRENDERER_DIR}/NULLRendererInstanceBuffer.h
	${SAMPLE_NULLRENDERER_DIR}/NULLRendererMaterial.cpp
	${SAMPLE_NULLRENDERER_DIR}/NULLRendererMaterial.h
	${SAMPLE_NULLRENDERER_DIR}/NULLRendererMesh.cpp
	${SAMPLE_NULLRENDERER_DIR}/NULLRendererMesh.h
	${SAMPLE_NULLRENDERER_DIR}/NULLRendererSpotLight.cpp
	${SAMPLE_NULLRENDERER_DIR}/NULLRendererSpotLight.h
	${SAMPLE_NULLRENDERER_DIR}/NULLRendererTexture2D.cpp
	${SAMPLE_NULLRENDERER_DIR}/NULLRendererTexture2D.h
	${SAMPLE_NULLRENDERER_DIR}/NULLRendererVertexBuffer.cpp
	${SAMPLE_NULLRENDERER_DIR}/NULLRendererVertexBuffer.h
)

SET(SAMPLE_D3D9RENDERER_DIR ${PHYSX_ROOT_DIR}/samples/sampleframework/renderer/src/d3d9)
SET(SAMPLERENDERER_D3D9RENDERER_SOURCES
	${SAMPLE_D3D9RENDERER_DIR}/D3D9Renderer.cpp
	${SAMPLE_D3D9RENDERER_DIR}/D3D9Renderer.h
	${SAMPLE_D3D9RENDERER_DIR}/D3D9RendererDirectionalLight.cpp
	${SAMPLE_D3D9RENDERER_DIR}/D3D9RendererDirectionalLight.h
	${SAMPLE_D3D9RENDERER_DIR}/D3D9RendererIndexBuffer.cpp
	${SAMPLE_D3D9RENDERER_DIR}/D3D9RendererIndexBuffer.h
	${SAMPLE_D3D9RENDERER_DIR}/D3D9RendererInstanceBuffer.cpp
	${SAMPLE_D3D9RENDERER_DIR}/D3D9RendererInstanceBuffer.h
	${SAMPLE_D3D9RENDERER_DIR}/D3D9RendererMaterial.cpp
	${SAMPLE_D3D9RENDERER_DIR}/D3D9RendererMaterial.h
	${SAMPLE_D3D9RENDERER_DIR}/D3D9RendererMesh.cpp
	${SAMPLE_D3D9RENDERER_DIR}/D3D9RendererMesh.h
	${SAMPLE_D3D9RENDERER_DIR}/D3D9RendererSpotLight.cpp
	${SAMPLE_D3D9RENDERER_DIR}/D3D9RendererSpotLight.h
	${SAMPLE_D3D9RENDERER_DIR}/D3D9RendererTarget.cpp
	${SAMPLE_D3D9RENDERER_DIR}/D3D9RendererTarget.h
	${SAMPLE_D3D9RENDERER_DIR}/D3D9RendererTexture2D.cpp
	${SAMPLE_D3D9RENDERER_DIR}/D3D9RendererTexture2D.h
	${SAMPLE_D3D9RENDERER_DIR}/D3D9RendererVertexBuffer.cpp
	${SAMPLE_D3D9RENDERER_DIR}/D3D9RendererVertexBuffer.h
	${SAMPLE_D3D9RENDERER_DIR}/D3D9WPFRenderer.cpp
	${SAMPLE_D3D9RENDERER_DIR}/D3D9WPFRenderer.h
)

SET(SAMPLE_D3D11RENDERER_DIR ${PHYSX_ROOT_DIR}/samples/sampleframework/renderer/src/d3d11)
SET(SAMPLERENDERER_D3D11RENDERER_SOURCES
	${SAMPLE_D3D11RENDERER_DIR}/D3D11Renderer.cpp
	${SAMPLE_D3D11RENDERER_DIR}/D3D11Renderer.h
	${SAMPLE_D3D11RENDERER_DIR}/D3D11RendererDirectionalLight.cpp
	${SAMPLE_D3D11RENDERER_DIR}/D3D11RendererDirectionalLight.h
	${SAMPLE_D3D11RENDERER_DIR}/D3D11RendererIndexBuffer.cpp
	${SAMPLE_D3D11RENDERER_DIR}/D3D11RendererIndexBuffer.h
	${SAMPLE_D3D11RENDERER_DIR}/D3D11RendererInstanceBuffer.cpp
	${SAMPLE_D3D11RENDERER_DIR}/D3D11RendererInstanceBuffer.h
	${SAMPLE_D3D11RENDERER_DIR}/D3D11RendererMaterial.cpp
	${SAMPLE_D3D11RENDERER_DIR}/D3D11RendererMaterial.h
	${SAMPLE_D3D11RENDERER_DIR}/D3D11RendererMemoryMacros.h
	${SAMPLE_D3D11RENDERER_DIR}/D3D11RendererMesh.cpp
	${SAMPLE_D3D11RENDERER_DIR}/D3D11RendererMesh.h
	${SAMPLE_D3D11RENDERER_DIR}/D3D11RendererResourceManager.h
	${SAMPLE_D3D11RENDERER_DIR}/D3D11RendererSpotLight.cpp
	${SAMPLE_D3D11RENDERER_DIR}/D3D11RendererSpotLight.h
	${SAMPLE_D3D11RENDERER_DIR}/D3D11RendererTarget.cpp
	${SAMPLE_D3D11RENDERER_DIR}/D3D11RendererTarget.h
	${SAMPLE_D3D11RENDERER_DIR}/D3D11RendererTexture2D.cpp
	${SAMPLE_D3D11RENDERER_DIR}/D3D11RendererTexture2D.h
	${SAMPLE_D3D11RENDERER_DIR}/D3D11RendererTexture3D.cpp
	${SAMPLE_D3D11RENDERER_DIR}/D3D11RendererTexture3D.h
	${SAMPLE_D3D11RENDERER_DIR}/D3D11RendererTextureCommon.h
	${SAMPLE_D3D11RENDERER_DIR}/D3D11RendererTraits.h
	${SAMPLE_D3D11RENDERER_DIR}/D3D11RendererUtils.cpp
	${SAMPLE_D3D11RENDERER_DIR}/D3D11RendererUtils.h
	${SAMPLE_D3D11RENDERER_DIR}/D3D11RendererVariableManager.cpp
	${SAMPLE_D3D11RENDERER_DIR}/D3D11RendererVariableManager.h
	${SAMPLE_D3D11RENDERER_DIR}/D3D11RendererVertexBuffer.cpp
	${SAMPLE_D3D11RENDERER_DIR}/D3D11RendererVertexBuffer.h
)

SET(SAMPLE_OGLRENDERER_DIR ${PHYSX_ROOT_DIR}/samples/sampleframework/renderer/src/ogl)
SET(SAMPLERENDERER_OGLRENDERER_SOURCES
	${PHYSX_ROOT_DIR}/samples/sampleframework/renderer/include/windows/WindowsGLIncludes.h
	${SAMPLE_OGLRENDERER_DIR}/OGLRenderer.cpp
	${SAMPLE_OGLRENDERER_DIR}/OGLRenderer.h
	${SAMPLE_OGLRENDERER_DIR}/OGLRendererDirectionalLight.cpp
	${SAMPLE_OGLRENDERER_DIR}/OGLRendererDirectionalLight.h
	${SAMPLE_OGLRENDERER_DIR}/OGLRendererIndexBuffer.cpp
	${SAMPLE_OGLRENDERER_DIR}/OGLRendererIndexBuffer.h
	${SAMPLE_OGLRENDERER_DIR}/OGLRendererInstanceBuffer.cpp
	${SAMPLE_OGLRENDERER_DIR}/OGLRendererInstanceBuffer.h
	${SAMPLE_OGLRENDERER_DIR}/OGLRendererMaterial.cpp
	${SAMPLE_OGLRENDERER_DIR}/OGLRendererMaterial.h
	${SAMPLE_OGLRENDERER_DIR}/OGLRendererMesh.cpp
	${SAMPLE_OGLRENDERER_DIR}/OGLRendererMesh.h
	${SAMPLE_OGLRENDERER_DIR}/OGLRendererSpotLight.cpp
	${SAMPLE_OGLRENDERER_DIR}/OGLRendererSpotLight.h
	${SAMPLE_OGLRENDERER_DIR}/OGLRendererTexture2D.cpp
	${SAMPLE_OGLRENDERER_DIR}/OGLRendererTexture2D.h
	${SAMPLE_OGLRENDERER_DIR}/OGLRendererVertexBuffer.cpp
	${SAMPLE_OGLRENDERER_DIR}/OGLRendererVertexBuffer.h
)

SET(SAMPLERENDERER_PLATFORM_SOURCES
	${SAMPLERENDERER_NULLRENDERER_SOURCES}
	${SAMPLERENDERER_D3D9RENDERER_SOURCES}
	${SAMPLERENDERER_D3D11RENDERER_SOURCES}
	${SAMPLERENDERER_OGLRENDERER_SOURCES}
)

SET(SAMPLERENDERER_PLATFORM_INCLUDES
	${DIRECTX_INCLUDE_DIRS}
)
