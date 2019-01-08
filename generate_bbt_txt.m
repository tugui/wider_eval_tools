load('ground_truth/wider_face_val.mat')

setting_names = {'easy_val';'medium_val';'hard_val'};

for i = 1:length(setting_names)
    gt_path = sprintf('./ground_truth/wider_%s.mat',setting_names{i});
    face_bbx_list = add_flag_col(face_bbx_list, i, gt_path);
end

output('wider_val_bbx.txt', event_list, file_list, face_bbx_list)


function face_bbx_list = add_flag_col(face_bbx_list, flag_col, matfile)
    load(matfile, 'gt_list')
    event_num = 61;
    flag_col = flag_col + 4;
    for i = 1:event_num
        sub_gt_list = gt_list{i};
        for j = 1:length(face_bbx_list{i})
            keep_index = sub_gt_list{j};
            face_bbx_list{i}{j}(:,flag_col) = 0;
            for k = 1:length(keep_index)
                idx = keep_index(k);
                face_bbx_list{i}{j}(idx,flag_col) = 1;
            end
        end
    end
end

function [] = output(out_path, event_list, file_list, face_bbx_list)
    fid = fopen(out_path, 'wt');
    for i = 1:length(event_list)
        event = event_list{i};
        for j = 1:length(file_list{i})
            file_name = [event,'/',file_list{i}{j},'.jpg'];
            bboxes = face_bbx_list{i}{j};
            fprintf(fid, '%s\n', file_name);
            fprintf(fid, '%d\n', length(bboxes));
            [row,~] = size(bboxes);
            for r = 1:row
                fprintf(fid, '%d %d %d %d %d %d %d\n', bboxes(r,:));
            end
        end
    end
    fclose(fid);
end
