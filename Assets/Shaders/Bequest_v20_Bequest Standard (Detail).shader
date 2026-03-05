Shader "Bequest_v20/Bequest Standard (Detail)" {
	Properties {
		[HideInInspector] _DetailFoldout ("Settings", Float) = 0
		[HideInInspector] _MaterialFoldout ("Settings", Float) = 0
		[HideInInspector] _ShowDefault ("Show Default Editor", Float) = 0
		[NoScaleOffset] _ColorTex ("Color", 2D) = "white" {}
		[NoScaleOffset] _LightmapTex ("Detail", 2D) = "white" {}
		_TileX ("Tiles X", Float) = 4
		_TileY ("Tiles Y", Float) = 4
		_TileAmount ("Tile amount", Float) = 10
		_BleedingDelta ("Margin (pixels)", Float) = 1
		[NoScaleOffset] _HashesTex ("Hatches", 2D) = "white" {}
		[NoScaleOffset] _DirtTex ("Material", 2D) = "white" {}
		_TileXDirt ("Tiles X Material", Float) = 4
		_TileYDirt ("Tiles Y Material", Float) = 4
		_TileAmountDirt ("Tile amount Material", Float) = 10
		_BleedingDeltaDirt ("Margin (pixels) Material", Float) = 1
		[NoScaleOffset] _SpecMap ("SpecularMap", 2D) = "white" {}
		_SpecularLevel ("Glossiness", Float) = 40
		_SpecularOpacity ("Intensity", Range(0, 1)) = 0.5
		_Saturation ("Saturation", Float) = 1
		_OpacityLightmap ("Opacity", Range(0, 1)) = 1
		[IntRange] _InverseLightmap ("Invert", Range(0, 1)) = 0
		[KeywordEnum(Multiply, Overlay, Screen)] _Lightmap_Blend ("Blend", Float) = 0
		_OpacityHashes ("Opacity", Range(0, 1)) = 1
		[IntRange] _InverseHashes ("Invert", Range(0, 1)) = 0
		[KeywordEnum(Multiply, Overlay, Screen)] _Hashes_Blend ("Blend", Float) = 0
		[Header(Dirt)] _OpacityDirt ("Opacity", Range(0, 1)) = 1
		[IntRange] _InverseDirt ("Invert", Range(0, 1)) = 0
		[KeywordEnum(Multiply, Overlay, Screen)] _Dirt_Blend ("Blend", Float) = 0
		_RimPower ("Rim power", Float) = 4
		_RimColor ("Rim color", Vector) = (1,1,1,1)
		_RampContrast ("Ramp Contrast", Float) = 1
		_RampOffset ("Ramp Offset", Float) = 0
		_RampColor1 ("Ramp Color A", Vector) = (0,0,0,1)
		_RampColor2 ("Ramp Color B", Vector) = (1,1,1,1)
		_RimOffset ("Rim rotation", Vector) = (0,0,0,1)
		_RimContrast ("Rim Contrast", Float) = 1
		_RimWidth ("Rim Width", Float) = 0
		_LightingFix ("LightingFix", Range(0, 1)) = 0
		_highlightFactor ("Highlight", Range(0, 1)) = 0
		[Toggle(DISTANCE_SQUISH)] _enableDistanceSquish ("Distance squish", Float) = 0
		_FadeStart ("Start fade dist", Float) = 10
		_FadeEnd ("End fade dist", Float) = 50
		_ScaleInfluence ("Scale influence per-axis", Vector) = (0,0,1,0)
	}
	//DummyShaderTextExporter
	SubShader{
		Tags { "RenderType" = "Opaque" }
		LOD 200

		Pass
		{
			HLSLPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;

			struct Vertex_Stage_Input
			{
				float4 pos : POSITION;
			};

			struct Vertex_Stage_Output
			{
				float4 pos : SV_POSITION;
			};

			Vertex_Stage_Output vert(Vertex_Stage_Input input)
			{
				Vertex_Stage_Output output;
				output.pos = mul(unity_MatrixVP, mul(unity_ObjectToWorld, input.pos));
				return output;
			}

			float4 frag(Vertex_Stage_Output input) : SV_TARGET
			{
				return float4(1.0, 1.0, 1.0, 1.0); // RGBA
			}

			ENDHLSL
		}
	}
	//CustomEditor "BequestShaderGUI"
}