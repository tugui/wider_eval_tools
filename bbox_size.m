setting_name='hard_val';
gt_dir = sprintf('./ground_truth/wider_%s.mat',setting_name);


load(gt_dir)
bboxes=zeros(0,4);
for i = 1:length(gt_list)
    sub_gt_list = gt_list{i};
    gt_bbx_list = face_bbx_list{i};
    for j = 1:length(gt_bbx_list)
        gt_bbx = gt_bbx_list{j};
        keep_index = sub_gt_list{j};
        for k = keep_index
            bboxes = cat(1, bboxes, gt_bbx(k,:));
        end
    end
end

histogram(bboxes(:,3), (1:300));