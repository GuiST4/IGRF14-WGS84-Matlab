function generate_c_header()
    % Generates src_c/igrf_data.h from the .mat coefficients
    load('../data/igrf14coeffs.mat', 'C_nm');
    
    % Verify size (N=13 -> 14x57 matrix)
    sz = 14; 
    
    fid = fopen('../src_c/igrf_data.h', 'w');
    fprintf(fid, '#ifndef IGRF_DATA_H\n#define IGRF_DATA_H\n\n');
    fprintf(fid, '// IGRF-14 Coefficients (Epoch 2025.0)\n');
    fprintf(fid, '// Generated automatically from MATLAB\n\n');
    
    % Helper to write arrays
    write_c_array(fid, 'g_coeff', C_nm(1:sz, 1:sz));
    write_c_array(fid, 'h_coeff', C_nm(1:sz, sz+1:2*sz));
    write_c_array(fid, 'g_sv',    C_nm(1:sz, 2*sz+1:3*sz));
    write_c_array(fid, 'h_sv',    C_nm(1:sz, 3*sz+1:4*sz));
    
    fprintf(fid, '#endif\n');
    fclose(fid);
    fprintf('Header generated in src_c/igrf_data.h\n');
end

function write_c_array(fid, name, mat)
    % Flattens 14x14 matrix to 1D array
    data = mat(:); % Column-major (MATLAB default)
    fprintf(fid, 'static const float %s[%d] = {\n', name, length(data));
    for i = 1:length(data)
        fprintf(fid, '%12.4f,', data(i));
        if mod(i, 10) == 0, fprintf(fid, '\n'); end
    end
    fprintf(fid, '};\n\n');
end