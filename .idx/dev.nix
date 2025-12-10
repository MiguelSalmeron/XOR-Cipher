# Para saber más sobre cómo configurar tu entorno con Nix
# visita: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs, ... }: {
  # Canal de paquetes (estable)
  channel = "stable-24.05"; 

  # AQUÍ ESTÁ LA MAGIA: Instalamos el compilador y herramientas
  packages = [
    pkgs.gcc        # El compilador de C (lo que te faltaba)
    pkgs.gnumake    # Para usar el comando 'make'
    pkgs.gdb        # Debugger (útil para encontrar errores)
    pkgs.man        # Manuales de Linux (man pages)
  ];

  # Variables de entorno
  env = {};

  idx = {
    # Extensiones útiles para C en VS Code
    extensions = [
      "google.gemini-cli-vscode-ide-companion"
      "ms-vscode.cpptools"  # Resaltado de sintaxis y herramientas C/C++
    ];

    # Previsualizaciones (no necesarias para CLI, pero se dejan activadas)
    previews = {
      enable = true;
      previews = {};
    };

    # Hooks del ciclo de vida del espacio de trabajo
    workspace = {
      onCreate = {
        # Abrir estos archivos al crear el entorno
        default.openFiles = [ "main.c" "README.md" ];
      };
      onStart = {};
    };
  };
}